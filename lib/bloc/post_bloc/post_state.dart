part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostLoadUninitialized extends PostState {}

class PostLoadInProgress extends PostState {}

class PostLoadFailure extends PostState {
  final String message;

  PostLoadFailure(this.message) : assert(message != null);
}

class PostLoadSuccess extends PostState {
  final List<Post> posts;

  PostLoadSuccess(this.posts) : assert(posts != null);
}
