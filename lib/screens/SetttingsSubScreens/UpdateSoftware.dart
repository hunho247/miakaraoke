import 'package:flutter/material.dart';

class UpdateSoftware extends StatefulWidget {
  @override
  _UpdateSoftwareState createState() => _UpdateSoftwareState();
}

double height = 0;
double width = 0;

class _UpdateSoftwareState extends State<UpdateSoftware> {

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
              child:
                  Text("Cập nhật", style: Theme.of(context).textTheme.display1),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 120.0, left: 50, right: 50),
            child: Text(
              "Phần mềm đã được cập nhật bản mới nhất.",
              style: Theme.of(context).textTheme.display2,
            ),
          ),
        ],
      ),
    );
  }
}
