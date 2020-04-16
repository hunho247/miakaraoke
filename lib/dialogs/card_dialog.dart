import 'package:flutter/material.dart';

class CardDialog extends StatelessWidget {
  final Widget child;
  final String message;
  final String btnText;
  final Function onTap;

  CardDialog({Key key, this.child, this.message, this.btnText, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _exitDialog(context),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    message,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FlatButton(
                    colorBrightness: Brightness.dark,
                    child: Text(btnText ?? 'Ok'),
                    color: Colors.red,
                    onPressed: () {
                      Navigator.pop(context);
                      if (onTap != null) {
                        onTap();
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _exitDialog(BuildContext context) {}
}
