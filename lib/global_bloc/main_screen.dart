import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:expanding_bottom_bar/expanding_bottom_bar.dart';
import 'package:miakaraoke/screens/karaoke/search/search_screen.dart';
import 'package:miakaraoke/screens/show/show_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  DateTime _currentBackPressTime;
  PageController _pageController;
  int _page = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _exitDialog(context),
      child: Scaffold(
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: <Widget>[
            ShowScreen(),
            SearchScreen(),
            ShowScreen(),
            ShowScreen(),
          ],
        ),
        bottomNavigationBar: ExpandingBottomBar(
          animationDuration: Duration(milliseconds: 250),
          backgroundColor: Theme.of(context).bottomAppBarColor,
          navBarHeight: 70,
          items: [
            ExpandingBottomBarItem(
              icon: Icons.local_play,
              text: "TRÌNH DIỄN",
              selectedColor: Colors.pinkAccent,
            ),
            ExpandingBottomBarItem(
              icon: Icons.library_music,
              text: "KARAOKE",
              selectedColor: Colors.deepPurpleAccent,
            ),
            ExpandingBottomBarItem(
              icon: Icons.favorite,
              text: "YÊU THÍCH",
              selectedColor: Colors.red,
            ),
            ExpandingBottomBarItem(
              icon: Icons.person,
              text: "TÀI KHOẢN",
              selectedColor: Colors.blueAccent,
            ),
          ],
          selectedIndex: _page,
          onIndexChanged: (i) {
            setState(
              () {
                _page = i;
                _pageController.jumpToPage(i);
              },
            );
          },
        ),
      ),
    );
  }

  _exitDialog(BuildContext context) {
    DateTime now = DateTime.now();
    if (_currentBackPressTime == null ||
        now.difference(_currentBackPressTime) > Duration(seconds: 2)) {
      _currentBackPressTime = now;
      Fluttertoast.showToast(msg: 'Tap back again to leave');
      return Future.value(false);
    }
    return Future.value(true);
  }
}
