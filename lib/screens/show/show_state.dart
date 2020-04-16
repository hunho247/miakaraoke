import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ShowState extends Equatable {
  final Iterable _props;

  ShowState([this._props]);

  @override
  List<Object> get props {
    return [_props];
  }
}

class InitShowState extends ShowState {}

class ErrorShowState extends ShowState {
  final String errorMessage;

  ErrorShowState(this.errorMessage);
}
