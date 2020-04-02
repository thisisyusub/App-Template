part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class PostLoadUninitialized extends HomeState {}

class PostLoadInProgress extends HomeState {}

class PostLoadFailure extends HomeState {
  final String message;

  PostLoadFailure(this.message) : assert(message != null);
}

class PostLoadSuccess extends HomeState {
  final List<Post> posts;

  PostLoadSuccess(this.posts) : assert(posts != null);
}
