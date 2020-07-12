/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusub@gmail.com>, July 2020
 */

part of './favorite_bloc.dart';

class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteUnitialized extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteSuccess extends FavoriteState {
  final List<Post> favoritePosts;

  FavoriteSuccess(this.favoritePosts) : assert(favoritePosts != null);

  @override
  List<Object> get props => [favoritePosts];
}

class FavoriteEmpty extends FavoriteState {}
