import 'package:our_apps_template/contractors/impl_post_repository.dart';
import 'package:our_apps_template/contractors/impl_user_repository.dart';
import 'package:our_apps_template/data/repository/offline/offline_post_repository.dart';
import 'package:our_apps_template/data/repository/offline/offline_user_repository.dart';
import 'package:our_apps_template/data/repository/online/online_post_repository.dart';
import 'package:our_apps_template/data/repository/online/online_user_repository.dart';
import 'package:our_apps_template/data/service/connectivity_service.dart';

class ConnectivityFacade {
  ConnectivityFacade._();

  static Future<IUserRepository> startUserRepository() async {
    final isConnected = await ConnectivityService.isConnected();

    if (isConnected)
      return OnlineUserRepository();
    else
      return OfflineUserRepository();
  }

  static Future<IPostRepository> startPostRepository() async {
    final isConnected = await ConnectivityService.isConnected();

    if (isConnected)
      return OnlinePostRepository();
    else
      return OfflinePostRepository();
  }
}
