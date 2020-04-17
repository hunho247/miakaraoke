import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miakaraoke/model/firebase/favorite_model.dart';
import 'package:miakaraoke/model/youtube/search_model.dart';
import 'package:miakaraoke/screens/karaoke/favorite/favorite_bloc.dart';
import 'package:miakaraoke/screens/karaoke/favorite/favorite_event.dart';
import 'package:miakaraoke/widget/centered_message.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'youtube_bloc.dart';
import 'youtube_state.dart';

class YoutubeScreen extends StatefulWidget {
  final SearchItem videoItem;

  const YoutubeScreen(this.videoItem);

  @override
  _YoutubeScreenState createState() {
    return _YoutubeScreenState(videoItem);
  }
}

class _YoutubeScreenState extends State<YoutubeScreen> {
  final SearchItem videoItem;
  YoutubePlayerController _controller;

  _YoutubeScreenState(this.videoItem) {
    _controller = YoutubePlayerController(
      initialVideoId: videoItem.id.videoId,
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
        onPressed: () {
          _postFavorite();
        },
        child: Icon(Icons.favorite_border),
        backgroundColor: Colors.red,
      ),
    );
  }

  Widget _buildResultList(var state) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
    );
  }

  _postFavorite() {
    Favorite favorite = Favorite(
      videoId: videoItem.id.videoId,
      title: videoItem.snippet.title,
      description: videoItem.snippet.description,
      thumbnail: videoItem.snippet.thumbnails.high.url,
      favCount: 1,
    );
    FavoriteBloc().add(PostingFavoriteEvent(favorite));
  }
}
