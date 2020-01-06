import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Information extends StatefulWidget {
  @override
  _InformationState createState() => _InformationState();
}

double height = 0;
double width = 0;

class _InformationState extends State<Information> {
  _launchURL() async {
    const url = 'http://varmyapp.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
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
              child: Text("Giới thiệu",
                  style: Theme.of(context).textTheme.display1),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 120.0, left: 50, right: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Mọi chi tiết xin liên hệ thông qua email: varmyapp@gmail.com\n',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Sans',
                  ),
                ),
                GestureDetector(
                  onTap: _launchURL,
                  child: Text(
                    'http://varmyapp.com/',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Sans',
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
