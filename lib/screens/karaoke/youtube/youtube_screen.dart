import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miakaraoke/widget/centered_message.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'youtube_bloc.dart';
import 'youtube_state.dart';

class YoutubeScreen extends StatefulWidget {
  final String videoId;

  const YoutubeScreen(this.videoId);

  @override
  _YoutubeScreenState createState() {
    return _YoutubeScreenState(videoId);
  }
}

class _YoutubeScreenState extends State<YoutubeScreen> {
  final String videoId;
  YoutubePlayerController _controller;

  _YoutubeScreenState(this.videoId) {
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildScaffold();
  }

  _buildScaffold() {
    return Scaffold(
      body: BlocBuilder(
        bloc: YoutubeBloc(),
        builder: (context, YoutubeState state) {
          if (state.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.isSuccessful) {
            return _buildResultList(state);
          } else {
            return CenteredMessage(
              message: state.error,
              icon: Icons.error_outline,
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.navigation),
        backgroundColor: Colors.green,
      ),
    );
  }

  Widget _buildResultList(var state) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
    );
  }
}
