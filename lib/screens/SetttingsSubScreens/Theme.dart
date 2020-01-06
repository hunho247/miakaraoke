import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/ThemeModel.dart';
import '../../themes/Themes.dart';

class Themes extends StatefulWidget {
  @override
  _ThemesState createState() => _ThemesState();
}

double height = 0;
double width = 0;

class _ThemesState extends State<Themes> {
  ThemeChanger themeChanger;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AppBar(
            leading: Padding(
              padding: EdgeInsets.only(top: height * 0.016, left: width * 0.03),
              child: IconButton(
                iconSize: 25.0,
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.grey,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            backgroundColor: Theme.of(context).backgroundColor,
            centerTitle: true,
            title: Padding(
              padding: EdgeInsets.only(top: height * 0.022),
              child: Text("Giao diện",
                  style: Theme.of(context).textTheme.display1),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 120.0, left: width * 0.02),
            child: ListTile(
              trailing: Icon(
                Icons.brush,
                size: 25.0,
                color: Colors.grey,
              ),
              title: Text(
                "Thay đổi giao diện",
                style: Theme.of(context).textTheme.display2,
              ),
              onTap: () {
                _settingModalBottomSheet(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  _settingModalBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          color: Theme.of(context).backgroundColor,
          child: new Wrap(
            children: <Widget>[
              new ListTile(
                leading: new Icon(
                  Icons.brush,
                  color: Colors.grey,
                ),
                title: new Text(
                  'White',
                  style: Theme.of(context).textTheme.display2,
                ),
                onTap: () => {
                  themeChanger.setTheme(
                    lightTheme(),
                  ),
                  Navigator.pop(context),
                },
              ),
              new ListTile(
                leading: new Icon(
                  Icons.brush,
                  color: Colors.grey,
                ),
                title: new Text(
                  'Dark',
                  style: Theme.of(context).textTheme.display2,
                ),
                onTap: () => {
                  themeChanger.setTheme(
                    darkTheme(),
                  ),
                  Navigator.pop(context),
                },
              ),
              new ListTile(
                leading: new Icon(
                  Icons.brush,
                  color: Colors.grey,
                ),
                title: new Text(
                  'Amoled Black',
                  style: Theme.of(context).textTheme.display2,
                ),
                onTap: () => {
                  themeChanger.setTheme(
                    darkAFTheme(),
                  ),
                  Navigator.pop(context),
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
