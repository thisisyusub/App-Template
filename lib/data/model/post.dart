/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusub@gmail.com>, July 2020
 */

import '../../utils/constants/constants.dart' show DatabaseKeys;

class Post {
  int userId;
  int id;
  String title;
  String body;
  int isFavorite;

  Post({
    this.userId,
    this.id,
    this.title,
    this.body,
    this.isFavorite = 0,
  });

  Post.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
    isFavorite = 0;
  }

  Map<String, dynamic> toMap() =>
      {
        '${DatabaseKeys.postId}': id,
        '${DatabaseKeys.userId}': userId,
        '${DatabaseKeys.title}': title,
        '${DatabaseKeys.body}': body,
        '${DatabaseKeys.isFavorite}': isFavorite,
      };

  Post.fromMap(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
    isFavorite = json['isFavorite'];
  }

  @override
  String toString() => '''
  ${DatabaseKeys.postId} : $id,
  ${DatabaseKeys.userId} : $userId,
  ${DatabaseKeys.title} : $title,
  ${DatabaseKeys.body} : $body,
  ${DatabaseKeys.isFavorite}: $isFavorite,
  ''';
}
