import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miakaraoke/model/firebase/favorite_model.dart';
import 'package:miakaraoke/model/youtube/search_model.dart';
import 'package:miakaraoke/screens/karaoke/favorite/favorite_bloc.dart';
import 'package:miakaraoke/screens/karaoke/favorite/favorite_event.dart';
import 'package:miakaraoke/widget/centered_message.dart';
import 'package:popup_menu/popup_menu.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'youtube_bloc.dart';
import 'youtube_state.dart';

class YoutubeScreen extends StatefulWidget {
  final Favorite videoItem;

  const YoutubeScreen(this.videoItem);

  @override
  _YoutubeScreenState createState() {
    return _YoutubeScreenState(videoItem);
  }
}

class _YoutubeScreenState extends State<YoutubeScreen> {
  final Favorite videoItem;
  final GlobalKey _globalKey = GlobalKey();
  YoutubePlayerController _controller;

  _YoutubeScreenState(this.videoItem) {
    _controller = YoutubePlayerController(
      initialVideoId: videoItem.videoId,
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
    PopupMenu.context = context;
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
      floatingActionButton: MaterialButton(
        height: 45.0,
        key: _globalKey,
        onPressed: _showPopupMenu,
        child: Text('Show Menu'),
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
    FavoriteBloc().add(PostingFavoriteEvent(videoItem));
  }

  _showPopupMenu() {
    _postFavorite();
    PopupMenu popupMenu = PopupMenu(
      //backgroundColor: Colors.teal,
      //lineColor: Colors.tealAccent,
      maxColumn: 2,
      items: [
        MenuItem(
            title: 'Play',
            image: Icon(
              Icons.play_circle_outline,
              color: Colors.white,
            )),
        MenuItem(
            title: 'Delete',
            image: Icon(
              Icons.delete_outline,
              color: Colors.white,
            )),
      ],
      onClickMenu: _onClickPopupMenu,
    );
    popupMenu.show(widgetKey: _globalKey);
  }

  _onClickPopupMenu(MenuItemProvider item) {
    print('Click menu -> ${item.menuTitle}');
    switch (item.menuTitle) {
      case 'Play':
        break;
      case 'Delete':
        break;
      default:
    }
  }
}
