import 'package:flutter/material.dart';
import 'package:expanding_bottom_bar/expanding_bottom_bar.dart';
import 'Settings.dart';
import 'Bookmarks.dart';
import 'MusicLibrary.dart';
import 'Recorder.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with WidgetsBindingObserver {
  var index = 1;
  var screens = [RecorderScreen(), Library(), Bookmarks(), SettingsScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: screens[index],
      bottomNavigationBar: ExpandingBottomBar(
        animationDuration: Duration(milliseconds: 300),
        backgroundColor: Theme.of(context).backgroundColor,
        navBarHeight: 70,
        items: [
          ExpandingBottomBarItem(
            icon: Icons.mic_none,
            text: "Ghi âm",
            selectedColor: Colors.pinkAccent,
          ),
          ExpandingBottomBarItem(
            icon: Icons.music_note,
            text: "Thư viện",
            selectedColor: Colors.deepPurpleAccent,
          ),
          ExpandingBottomBarItem(
            icon: Icons.favorite_border,
            text: "Yêu thích",
            selectedColor: Colors.red,
          ),
          ExpandingBottomBarItem(
            icon: Icons.settings,
            text: "Cài đặt",
            selectedColor: Colors.blueAccent,
          ),
        ],
        selectedIndex: index,
        onIndexChanged: (i) {
          setState(
            () {
              index = i;
            },
          );
        },
      ),
    );
  }
}
