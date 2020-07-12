/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusub@gmail.com>, July 2020
 */


import '../../../contractors/impl_post_repository.dart';
import '../../model/post.dart';
import '../../service/database_service.dart';


class OfflinePostRepository implements IPostRepository {
  @override
  Future<List<Post>> getAllPosts() async {
    final db = await DatabaseService.instance;
    final posts = db.getAllPosts();
    return posts;
  }
}
