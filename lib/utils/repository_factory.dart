/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusub@gmail.com>, July 2020
 */

import '../contractors/base_repository.dart';
import '../data/repository/offline/offline_post_repository.dart';
import '../data/repository/offline/offline_user_repository.dart';
import '../data/repository/online/online_post_repository.dart';
import '../data/repository/online/online_user_repository.dart';
import '../data/service/connectivity_service.dart';
import './constants/enums.dart';

class RepositoryFactory {
  RepositoryFactory._();

  static Future<IBaseRepository> createRepository(
      Repository repositoryType) async {
    final isConnected = await ConnectivityService.isConnected();

    switch (repositoryType) {
      case Repository.User:
        return isConnected ? OnlineUserRepository() : OfflineUserRepository();
      case Repository.Post:
        return isConnected ? OnlinePostRepository() : OfflinePostRepository();
      default:
        throw Exception('Repository type is not supported!');
    }
  }
}
