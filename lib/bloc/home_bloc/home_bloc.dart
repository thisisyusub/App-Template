/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusub@gmail.com>, July 2020
 */

import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import './home_event.dart';
import './home_state.dart';
import '../../contractors/impl_post_repository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({@required this.postRepository}) : super(PostLoadUninitialized());

  final IPostRepository postRepository;

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
