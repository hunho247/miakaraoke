import 'package:flutter/material.dart';
import 'package:miakaraoke/widgets/ScrollDetection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'show_bloc.dart';
import 'show_state.dart';

class ShowScreen extends StatefulWidget {
  const ShowScreen({Key key}) : super(key: key);

  @override
  _ShowScreenState createState() {
    return _ShowScreenState();
  }
}

class _ShowScreenState extends State<ShowScreen> {
  ScrollDetection _scrollDetection;

  @override
  void initState() {
    super.initState();
    _scrollDetection = ScrollDetection(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollDetection.controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: ShowBloc(),
      listener: (context, state) {},
      child: BlocBuilder<ShowBloc, ShowState>(
        bloc: ShowBloc(),
        builder: (
          BuildContext context,
          ShowState currentState,
        ) {
          if (currentState is ErrorShowState) {
            return Container(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  currentState.errorMessage ?? 'Error',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          } else {
            return _buildShowScreen();
          }
        },
      ),
    );
  }

  Widget _buildShowScreen() {
    return Center(child: Text('Show Screen'));
  }
}
