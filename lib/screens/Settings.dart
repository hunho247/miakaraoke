import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'SetttingsSubScreens/Theme.dart';
import 'SetttingsSubScreens/UpdateSoftware.dart';
import 'SetttingsSubScreens/Information.dart';
import 'package:share/share.dart';
import '../Animations/Transitions.dart';
import '../models/ThemeModel.dart';
import '../custom_icons.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

double height = 0;
double width = 0;

class _SettingsScreenState extends State<SettingsScreen> {
  final titles = [
    'Giao diện',
    'Cập nhật',
    'Giới thiệu',
  ];
  final subtitles = [
    'Tùy chỉnh giao diện và màu sắc của ứng dụng',
    "Cập nhật phiên bản mới nhất",
    "Biết thêm về chúng tôi",
  ];
  final icons = [
    CustomIcons.paint_brush,
    CustomIcons.leaf,
    CustomIcons.info_circle,
  ];
  ThemeChanger themeChanger;
  TextEditingController text = new TextEditingController();
  DateTime currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    themeChanger = Provider.of<ThemeChanger>(context);

    return WillPopScope(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).backgroundColor,
        body: Stack(
          children: <Widget>[
            AppBar(
                actions: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        top: height * 0.012, left: width * 0.03),
                    child: IconButton(
                      iconSize: 35.0,
                      icon: Icon(
                        CustomIcons.share_alt,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        Share.share('http://varmyapp.com/');
                      },
                    ),
                  ),
                ],
                backgroundColor: Theme.of(context).backgroundColor,
                centerTitle: true,
                title: Padding(
                  padding: EdgeInsets.only(top: height * 0.022),
                  child: Text(
                    "Cài đặt",
                    style: Theme.of(context).textTheme.display1,
                  ),
                )),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 100.0),
              child: Container(
                child: ListView.builder(
                  itemCount: titles.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          side: BorderSide(
                            width: 0.45,
                            color: themeChanger.accentColor,
                          ),
                        ),
                        color: Theme.of(context).cardColor,
                        elevation: 5.0,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ListTile(
                              onTap: () {
                                switch (index) {
                                  case 0:
                                    Navigator.push(
                                      context,
                                      EnterExitRoute(
                                        exitPage: SettingsScreen(),
                                        enterPage: Themes(),
                                      ),
                                    );
                                    break;
                                  case 1:
                                    Navigator.push(
                                      context,
                                      EnterExitRoute(
                                        exitPage: SettingsScreen(),
                                        enterPage: UpdateSoftware(),
                                      ),
                                    );
                                    break;
                                  case 2:
                                    Navigator.push(
                                      context,
                                      EnterExitRoute(
                                        exitPage: SettingsScreen(),
                                        enterPage: Information(),
                                      ),
                                    );
                                    break;
                                }
                              },
                              leading: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Icon(
                                  icons[index],
                                  color: Colors.grey,
                                ),
                              ),
                              title: Text(
                                titles[index],
                                style: Theme.of(context).textTheme.display3,
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: Text(
                                  subtitles[index],
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Theme.of(context)
                                          .textTheme
                                          .display1
                                          .color),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
      onWillPop: () {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
          return null;
        }

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
