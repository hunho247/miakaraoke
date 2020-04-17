import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  Widget _buildResultList(var snapshot) {
    return StreamBuilder(
      stream: snapshot,
      builder: (context, snapshots) {
        if (!snapshots.hasData) {
          return CenteredMessage(
            message: 'No Favorate',
            icon: Icons.favorite_border,
          );
        } else {
          return ListView.builder(
            itemCount: snapshots.data.documents.length,
            controller: _scrollController,
            itemBuilder: (context, index) {
              return _buildVideoListVideoItem(snapshots.data.documents[index]);
            },
          );
        }
      },
    );
  }

  Widget _buildVideoListVideoItem(var item) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 100.0),
        child: Card(
          child: InkWell(
            onTap: () {
              print("Card Clicked");
            },
            onLongPress: () {},
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
                        padding:
                            const EdgeInsets.only(top: 5, left: 5, right: 5),
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
        ),
      ),
    );
  }
}
