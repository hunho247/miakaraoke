import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:miakaraoke/utils/tools.dart';

class WaitingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: Center(
        child: SpinKitChasingDots(
          color: Tools.multiColors[Random().nextInt(3)],
        ),
      ),
    );
  }
}
