/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusub@gmail.com>, July 2020
 */

import 'package:our_apps_template/contractors/impl_user_repository.dart';
import 'package:our_apps_template/data/model/user.dart';
import 'package:our_apps_template/data/service/database_service.dart';
import 'package:our_apps_template/utils/exceptions/exceptions.dart';

class OfflineUserRepository extends IUserRepository {
  @override
  Future<User> getUserData(String userId) async {
    final dbService = await DatabaseService.instance;

    // read data of user from DB

    return User(
      name: 'Kanan Yusubov',
      email: 'kanan.yusub@gmail.com',
      id: 5,
      phone: '+994 77 536 19 99',
      username: 'YusubX',
      website: 'kanan.com',
    );
  }

  @override
  Future<User> login(String userId) {
    throw HttpException('You are offline :(');
  }

  @override
  Future<User> register(String userId) {
    throw HttpException('You are offline :(');
  }
}
