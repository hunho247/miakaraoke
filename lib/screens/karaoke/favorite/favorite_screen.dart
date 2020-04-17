import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miakaraoke/model/youtube/video_model.dart';
import 'package:miakaraoke/screens/karaoke/youtube/youtube_screen.dart';
import 'package:miakaraoke/widget/centered_message.dart';

import 'favorite_bloc.dart';
import 'favorite_event.dart';
import 'favorite_state.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key key}) : super(key: key);

  @override
  _FavoriteScreenState createState() {
    return _FavoriteScreenState();
  }
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return _buildScaffold();
  }

  _buildScaffold() {
    return Scaffold(
      body: BlocBuilder(
        bloc: FavoriteBloc(),
        builder: (context, FavoriteState state) {
          if (state is InitialFavoriteState) {
            return CenteredMessage(
              message: 'Favorite List',
              icon: Icons.favorite_border,
            );
          }

          return _buildResultList(state);
        },
      ),
    );
  }

  Widget _buildResultList(var state) {
    return NotificationListener<ScrollNotification>(
      child: ListView.builder(
        itemCount: state.favoriteResults.length,
        controller: _scrollController,
        itemBuilder: (context, index) {
          return _buildVideoListVideoItem(state.favoriteResults[index]);
        },
      ),
    );
  }

  int _calculateListVideoItemCount(var state) {
    if (state.hasReachedEndOfResults) {
      return state.favoriteResults.length;
    } else {
      return state.favoriteResults.length + 1;
    }
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification &&
        _scrollController.position.extentAfter == 0) {
      FavoriteBloc().add(FetchingFavoriteEvent());
    }
    return false;
  }

  Widget _buildVideoListVideoItem(VideoItem favoriteVideoItem) {
    return GestureDetector(
      child: _buildVideoListVideoItemCard(favoriteVideoItem.videoSnippet),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) {
            return YoutubeScreen(favoriteVideoItem.id.videoId);
          }),
        );
      },
    );
  }

  Widget _buildVideoListVideoItemCard(var videoVideoSnippet) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 200.0),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: videoVideoSnippet.thumbnails.high.url,
                  placeholder: (context, url) => Container(),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 0, right: 10),
                  child: Text(
                    videoVideoSnippet.title,
                    style: Theme.of(context).textTheme.title.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 0, right: 10),
                  child: Text(
                    videoVideoSnippet.description,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoaderListVideoItem() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
