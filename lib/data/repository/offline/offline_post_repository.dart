/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusub@gmail.com>, July 2020
 */

import 'package:our_apps_template/contractors/impl_post_repository.dart';
import 'package:our_apps_template/data/model/post.dart';

class OfflinePostRepository implements IPostRepository {
  @override
  Future<List<Post>> getAllPosts() {
    // TODO: read from database
    return null;
  }
}
