import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:miakaraoke/model/firebase/favorite_model.dart';
import 'package:miakaraoke/model/youtube/search_model.dart';
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
  final ScrollController _scrollController = ScrollController();
  SlidableController _slidableController = SlidableController();

  @override
  void initState() {
    FavoriteBloc().add(FetchingFavoriteEvent());
    super.initState();
  }

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
              message: 'Loading Favorite',
              icon: Icons.favorite_border,
            );
          }

          if (state is SuccessFavoriteState) {
            return _buildResultList(state.snapshot);
          }

          return CenteredMessage(
            message: 'Error!',
            icon: Icons.error_outline,
          );
        },
      ),
    );
  }

  Widget _buildResultList(Stream<QuerySnapshot> snapshot) {
    return StreamBuilder(
      stream: snapshot,
      builder: (context, snap) {
        if (!snap.hasData) {
          return CenteredMessage(
            message: 'No Favorate',
            icon: Icons.favorite_border,
          );
        } else {
          return ListView.builder(
            itemCount: snap.data.documents.length,
            controller: _scrollController,
            itemBuilder: (context, index) {
              return _buildSlidableItem(snap.data.documents[index]);
            },
          );
        }
      },
    );
  }

  Widget _buildSlidableItem(DocumentSnapshot item) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 100.0),
          child: Slidable(
            key: Key(item.data['videoId']),
            controller: _slidableController,
            actionPane: SlidableStrechActionPane(),
            actionExtentRatio: 0.25,
            child: _buildCardItem(item),
            actions: <Widget>[
              IconSlideAction(
                caption: 'Play',
                color: Colors.blue,
                icon: Icons.play_circle_outline,
                //onTap: _playFavKaraoke(item),
              ),
              IconSlideAction(
                caption: 'Share',
                color: Colors.indigo,
                icon: Icons.share,
                onTap: () => {},
              ),
            ],
            secondaryActions: <Widget>[
              IconSlideAction(
                caption: 'Delete',
                color: Colors.red,
                icon: Icons.delete_outline,
                onTap: () => {
                  FavoriteBloc()
                      .add(DeletingFavoriteEvent(item.data['videoId']))
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildCardItem(DocumentSnapshot item) {
    return GestureDetector(
      onTap: () {
        _playFavKaraoke(item);
      },
      child: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: item.data['thumbnail'] ?? '',
              placeholder: (context, url) => Container(),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      text: TextSpan(
                        style: Theme.of(context).textTheme.title.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                        text: item.data['title'] ?? '',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5, left: 5, right: 5, bottom: 5),
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      text: TextSpan(
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(fontSize: 10),
                        text: item.data['description'] ?? '',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _playFavKaraoke(DocumentSnapshot item) {
    Favorite videoItem = Favorite.fromJson(item.data);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) {
        return YoutubeScreen(videoItem);
      }),
    );
  }
}
