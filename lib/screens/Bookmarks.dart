import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:toast/toast.dart';
import '../models/ThemeModel.dart';
import '../models/BookmarkModel.dart';

double height = 0;
double width = 0;

const List<String> menus = <String>[
  'Bỏ yêu thích',
  'Chia sẽ',
];

class Bookmarks extends StatelessWidget {
  DateTime currentBackPressTime;
  ThemeChanger themeChanger;
  BookmarkModel bm;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    themeChanger = Provider.of<ThemeChanger>(context);
    bm = Provider.of<BookmarkModel>(context);
    bm.updateLikedKaraokes();

    return WillPopScope(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Stack(
          children: <Widget>[
            (bm.likedKaraokes == null)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : (bm.likedKaraokes.length == 0 ||
                        bm.likedKaraokes.length == null)
                    ? Center(
                        child: Text(
                          "Danh sách trống",
                          style: Theme.of(context).textTheme.display1,
                        ),
                      )
                    : Container(
                        width: width,
                        height: height * 0.15,
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.redAccent,
                                  ),
                                ),
                                Text("Yêu thích",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 30.0)),
                              ],
                            ),
                          ),
                        ),
                        // Add box decoration
                        decoration: BoxDecoration(
                          // Box decoration takes a gradient
                          gradient: LinearGradient(
                            // Where the linear gradient begins and ends
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            // Add one stop for each color. Stops should increase from 0 to 1
                            stops: [0.1, 0.5, 0.7, 0.9],
                            colors: [
                              Colors.lightBlue,
                              Colors.blue,
                              Colors.blueAccent,
                              Colors.blue,
                            ],
                          ),
                        ),
                      ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.15),
              child: ListView.builder(
                itemCount: bm.likedKaraokes.length,
                itemBuilder: (context, pos) {
                  return ListTile(
                    trailing: PopupMenuButton<String>(
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.grey,
                      ),
                      onSelected: (String choice) async {
                        if (choice == menus[0]) {
                          bm.markLikedKaraoke(pos, 0);
                          bm.likedKaraokes.removeAt(pos);
                        } else if (choice == menus[1]) {
                          Share.share('http://varmyapp.com/',
                              subject: bm.likedKaraokes[pos].title +
                                  '\n' +
                                  bm.likedKaraokes[pos].code);
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
                    onTap: () async {},
                    leading: CircleAvatar(
                      child: Container(
                        child: IconButton(
                          onPressed: null,
                          icon: Icon(
                            bm.likedKaraokes[pos].favorite == 0
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
                      bm.likedKaraokes[pos].title,
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
                            bm.likedKaraokes[pos].code,
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
                            bm.likedKaraokes[pos].lyric,
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
}
