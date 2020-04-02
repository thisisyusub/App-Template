import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_apps_template/data/model/post.dart';
import 'package:equatable/equatable.dart';
import 'package:our_apps_template/data/repository/post_repository.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({@required this.postRepository});

  final PostRepository postRepository;

  @override
  HomeState get initialState => PostLoadUninitialized();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is FetchPostsRequested) {
      yield* _mapFetchPostRequestedToState();
    }
  }

  Stream<HomeState> _mapFetchPostRequestedToState() async* {
    yield PostLoadInProgress();

    try {
      final posts = await postRepository.getAllPosts();
      yield PostLoadSuccess(posts);
    } catch (e) {
      yield PostLoadFailure(e.toString());
    }
  }
}
