/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusub@gmail.com>, July 2020
 */

import 'package:equatable/equatable.dart';
import '../../data/model/post.dart';

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
