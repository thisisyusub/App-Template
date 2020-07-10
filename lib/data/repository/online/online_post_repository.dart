/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusub@gmail.com>, July 2020
 */

import '../../../contractors/impl_post_repository.dart';
import '../../model/post.dart';
import '../../service/api_service.dart';
import '../../../utils/exceptions/exceptions.dart';

class OnlinePostRepository extends IPostRepository {
  final _apiService = ApiService();

  @override
  Future<List<Post>> getAllPosts() async {
    String endPoint = '/posts';
    final result = await _apiService.dio.get(endPoint);

    if (result.statusCode == 200) {
      final converted = result.data.map<Post>((x) => Post.fromJson(x)).toList();
      return converted;
    } else {
      throw HttpException('Error occured with ${result.statusCode}');
    }
  }
}
