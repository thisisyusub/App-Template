/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusub@gmail.com>, July 2020
 */

import './base_entity.dart';

class PostEntity extends EntityBase {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostEntity({this.userId, this.id, this.title, this.body}) : super(id);

  PostEntity.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        id = json['id'],
        title = json['title'],
        body = json['body'],
        super.fromJson(json);

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'id': id,
        'title': title,
        'body': body,
      };
}
