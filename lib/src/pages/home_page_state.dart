import 'package:live/apiServices/Models/sportmodels.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class HomePageState extends Equatable {
  HomePageState([List props = const []]) : super(props);
}

class HomePageStateDefault extends HomePageState {
  @override
  String toString() => 'HomePageStateDefault';
}

class HomePageStateSearching extends HomePageState {
  @override
  String toString() => 'HomePageStateLoading';
}

class HomePageStateError extends HomePageState {
  final String message;

  HomePageStateError({this.message});

  @override
  String toString() => 'HomePageStateError';
}

class HomePageStateSearched extends HomePageState {
  final SportsModel data;

  HomePageStateSearched({this.data});

  @override
  String toString() => 'HomePageStateLoaded';
}
