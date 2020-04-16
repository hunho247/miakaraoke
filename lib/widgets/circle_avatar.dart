import 'package:flutter/material.dart';

class DevCircleAvatar extends StatelessWidget {
  final String imgUrl;
  final double width;
  final double height;

  const DevCircleAvatar({
    Key key,
    @required this.imgUrl,
    @required this.width,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(.5),
              offset: Offset(0, 2),
              blurRadius: 5)
        ],
      ),
      child: CircleAvatar(
        backgroundImage: NetworkImage("$imgUrl"),
      ),
    );
  }
}
