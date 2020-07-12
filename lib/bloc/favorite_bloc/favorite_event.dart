/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusub@gmail.com>, July 2020
 */

part of './favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class FetchFavoritePostsRequested extends FavoriteEvent {}

class AddNewFavoritePostRequested extends FavoriteEvent {
  final Post post;

  AddNewFavoritePostRequested(this.post) : assert(post != null);

  @override
  List<Object> get props => [post];
}
