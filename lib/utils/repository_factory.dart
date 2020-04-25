import 'package:our_apps_template/contractors/i_repository.dart';
import 'package:our_apps_template/data/repository/offline/offline_post_repository.dart';
import 'package:our_apps_template/data/repository/offline/offline_user_repository.dart';
import 'package:our_apps_template/data/repository/online/online_post_repository.dart';
import 'package:our_apps_template/data/repository/online/online_user_repository.dart';
import 'package:our_apps_template/data/service/connectivity_service.dart';
import 'package:our_apps_template/utils/constants/enums.dart';

class RepositoryFactory {
  RepositoryFactory._();

  static Future<IRepository> createRepository(Repository repositoryType) async {
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
