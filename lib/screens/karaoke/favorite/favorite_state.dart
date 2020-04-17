import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class FavoriteState extends Equatable {
  final Iterable _props;

  FavoriteState([this._props]);

  @override
  List<Object> get props {
    return [_props];
  }
}

class InitialFavoriteState extends FavoriteState {}

class LoadingFavoriteState extends FavoriteState {}

class SuccessFavoriteState extends FavoriteState {
  final Stream<QuerySnapshot> snapshot;

  SuccessFavoriteState({@required this.snapshot}) : super([snapshot]);
}

class FailureFavoriteState extends FavoriteState {
  final String message;

  FailureFavoriteState(this.message) : super([message]);
}
