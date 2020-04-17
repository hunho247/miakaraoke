import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miakaraoke/model/youtube/search_model.dart';
import 'package:miakaraoke/screens/karaoke/youtube/youtube_screen.dart';
import 'package:miakaraoke/widget/centered_message.dart';

import 'search_bloc.dart';
import 'search_event.dart';
import 'search_state.dart';
import 'widget/search_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() {
    return _SearchScreenState();
  }
}

class _SearchScreenState extends State<SearchScreen> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return _buildScaffold();
  }

  _buildScaffold() {
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(),
      ),
      body: BlocBuilder(
        bloc: SearchBloc(),
        builder: (context, SearchState state) {
          if (state.isInitial) {
            return CenteredMessage(
              message: 'Start searching!',
              icon: Icons.ondemand_video,
            );
          }

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
    );
  }

  Widget _buildResultList(var state) {
    return NotificationListener<ScrollNotification>(
      child: ListView.builder(
        itemCount: state.searchResults.length,
        controller: _scrollController,
        itemBuilder: (context, index) {
          return _buildVideoListItem(state.searchResults[index]);
        },
      ),
    );
  }

  int _calculateListItemCount(var state) {
    if (state.hasReachedEndOfResults) {
      return state.searchResults.length;
    } else {
      return state.searchResults.length + 1;
    }
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification &&
        _scrollController.position.extentAfter == 0) {
      SearchBloc().add(FetchingSearchEvent());
    }
    return false;
  }

  Widget _buildVideoListItem(SearchItem videoItem) {
    return GestureDetector(
      child: _buildVideoListItemCard(videoItem.snippet),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) {
            return YoutubeScreen(videoItem);
          }),
        );
      },
    );
  }

  Widget _buildVideoListItemCard(SearchSnippet videoSnippet) {
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
                  imageUrl: videoSnippet.thumbnails.high.url,
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
                    videoSnippet.title,
                    style: Theme.of(context).textTheme.title.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 0, right: 10),
                  child: Text(
                    videoSnippet.description,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoaderListItem() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
