import 'package:flutter/material.dart';
import 'package:miakaraoke/utils/definition.dart';

class DevFabButton extends StatelessWidget {
  final bool isExtended;
  final IconData icon;
  final String title;
  final GestureTapCallback onPressed;

  DevFabButton(this.isExtended, {this.icon, this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      child: RawMaterialButton(
        elevation: 5.0,
        shape: isExtended
            ? RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)))
            : CircleBorder(),
        onPressed: onPressed,
        fillColor: Definitions.buttonsColor,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: isExtended
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      icon,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      title ?? "",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )
              : Icon(
                  icon,
                  color: Colors.white,
                ),
        ),
      ),
    );
  }
}
