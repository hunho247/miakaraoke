import 'package:flutter/material.dart';
import 'package:miakaraoke/utils/definition.dart';

class DevIconText extends StatelessWidget {
  final IconData icon;
  final String text;

  DevIconText({@required this.icon, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 14.0,
          color: Definitions.symbolsColor,
        ),
        SizedBox(width: 5),
        Flexible(
          child: RichText(
            overflow: TextOverflow.ellipsis,
            strutStyle: StrutStyle(fontSize: 12),
            text: TextSpan(
              style: Theme.of(context).textTheme.body1,
              text: text,
            ),
          ),
        ),
      ],
    );
  }
}
