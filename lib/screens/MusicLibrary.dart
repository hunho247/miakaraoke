import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:toast/toast.dart';
import '../models/ThemeModel.dart';
import '../models/KaraokeLibraryModel.dart';

double height, width;

const List<String> menus = <String>[
  'Thêm yêu thích',
  'Bỏ yêu thích',
  'Chia sẽ',
];

class Library extends StatefulWidget {
  @override
  _LibraryState createState() => new _LibraryState();
}

class _LibraryState extends State<Library> {
  DateTime currentBackPressTime;
  KaraokeLibraryModel library;
  ThemeChanger themeChanger;
  TextEditingController controller = new TextEditingController();

  int present = 0;
  int perPage = 20;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    themeChanger = Provider.of<ThemeChanger>(context);
    library = Provider.of<KaraokeLibraryModel>(context);
    //reloadList();

    return WillPopScope(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).backgroundColor,
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  width: width,
                  height: height * 0.15,
                  color: Theme.of(context).backgroundColor,
                  child: new Padding(
                    padding: const EdgeInsets.only(
                        top: 25, left: 10, right: 10, bottom: 5),
                    child: new Card(
                      child: new ListTile(
                        leading: new Icon(
                          Icons.search,
                          color: Theme.of(context).textTheme.display1.color,
                        ),
                        title: new TextField(
                          controller: controller,
                          style: TextStyle(
                            color: Theme.of(context).textTheme.display1.color,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Sans',
                          ),
                          decoration: new InputDecoration(
                            hintText: 'Tìm kiếm',
                            hintStyle: TextStyle(
                              color: Theme.of(context).textTheme.display1.color,
                              fontSize: 20,
                              fontWeight: FontWeight.w100,
                              fontFamily: 'Sans',
                            ),
                            border: InputBorder.none,
                          ),
                          onChanged: (val) => debounce(
                              const Duration(milliseconds: 500),
                              onSearchTextChanged,
                              [val]),
                        ),
                        trailing: new IconButton(
                          icon: new Icon(
                            Icons.cancel,
                            color: Theme.of(context).textTheme.display1.color,
                          ),
                          onPressed: () {
                            if (!controller.text.toString().isEmpty) {
                              controller.clear();
                              onSearchTextChanged('');
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                getLoading(library),
              ],
            ),
          ],
        ),
      ),
      onWillPop: () {
        DateTime now = DateTime.now();
        if (currentBackPressTime == null ||
            now.difference(currentBackPressTime) > Duration(seconds: 2)) {
          currentBackPressTime = now;
          Toast.show("Nhấn trở lại để thoát", context,
              duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
          return Future.value(false);
        }
        return Future.value(true);
      },
    );
  }

  onSearchTextChanged(String text) async {
    library.clear();
    if (text.isEmpty) {
      setState(() {
        present = 0;
        perPage = 20;

        library.addMoreKaraokeList(present, present + perPage);
        present = present + perPage;
      });
      return;
    }

    setState(() {
      library.searchKaraoke(text);
    });
  }

  Map<Function, Timer> _timeouts = {};

  debounce(Duration timeout, Function target, [List arguments = const []]) {
    if (_timeouts.containsKey(target)) {
      _timeouts[target].cancel();
    }

    Timer timer = Timer(timeout, () {
      Function.apply(target, arguments);
    });

    _timeouts[target] = timer;
  }

  loadMore() {
    setState(() {
      present = present + perPage;
      if ((present + perPage) > 60000) {
        return;
      } else {
        library.addMoreKaraokeList(present, present + perPage);
      }
    });
  }

  getLoading(KaraokeLibraryModel library) {
    if (library.karaokesong.length == 0) {
      return Expanded(
          child: Center(
        child: CircularProgressIndicator(),
      ));
    } else {
      return Expanded(
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent &&
                controller.text.isEmpty) {
              loadMore();
            }
          },
          child: ListView.builder(
            itemCount: library.karaokesong.length,
            itemBuilder: (context, pos) {
              return ListTile(
                trailing: PopupMenuButton<String>(
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.grey,
                  ),
                  onSelected: (String choice) async {
                    if (choice == menus[0]) {
                      library.markLikedKaraoke(pos, 1);
                    } else if (choice == menus[1]) {
                      library.markLikedKaraoke(pos, 0);
                    } else if (choice == menus[2]) {
                      Share.share(library.karaokesong[pos].code +
                          '\n' +
                          library.karaokesong[pos].title +
                          '\n' +
                          'http://varmyapp.com/');
                    }
                  },
                  itemBuilder: (BuildContext context) {
                    return menus.map((String choice) {
                      return PopupMenuItem<String>(
                        value: choice,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            choice,
                            style: Theme.of(context).textTheme.display2,
                          ),
                        ),
                      );
                    }).toList();
                  },
                ),
                onLongPress: () async {
                  library.karaokesong[pos].favorite == 1
                      ? library.markLikedKaraoke(pos, 0)
                      : library.markLikedKaraoke(pos, 1);
                },
                leading: CircleAvatar(
                  child: Container(
                    child: IconButton(
                      onPressed: null,
                      icon: Icon(
                        library.karaokesong[pos].favorite == 0
                            ? Icons.library_music
                            : Icons.favorite_border,
                        color: Colors.white,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70),
                      // Box decoration takes a gradient
                      gradient: LinearGradient(
                        colors: <Color>[
                          themeChanger.accentColor,
                          Color(0xFF1976D2),
                          Color(0xFF42A5F5),
                        ],
                      ),
                    ),
                  ),
                ),
                title: Text(
                  library.karaokesong[pos].title,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Sans'),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        library.karaokesong[pos].code,
                        maxLines: 1,
                        style: TextStyle(
                          color: Theme.of(context).textTheme.display1.color,
                          fontSize: 14,
                          fontFamily: 'Sans',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Text(
                        library.karaokesong[pos].lyric,
                        maxLines: 1,
                        style: TextStyle(
                          color: Theme.of(context).textTheme.display1.color,
                          fontSize: 14,
                          fontFamily: 'Sans',
                        ),
                      ),
                    ),
                  ],
                ),
                isThreeLine: true,
              );
            },
          ),
        ),
      );
    }
  }
}
