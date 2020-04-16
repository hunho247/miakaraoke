import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class GlobalState extends Equatable {
  final Iterable _props;

  GlobalState([this._props]);

  @override
  List<Object> get props {
    return [_props];
  }
}

class UnGlobalState extends GlobalState {}

class LogginginState extends GlobalState {}

class InGlobalState extends GlobalState {}

class ErrorGlobalState extends GlobalState {
  final String errorMessage;
  ErrorGlobalState(this.errorMessage);
}
