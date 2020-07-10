/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusub@gmail.com>, July 2020
 */

import './base_repository.dart';
import '../data/model/post.dart';

abstract class IPostRepository extends IBaseRepository {
  Future<List<Post>> getAllPosts();
}
