import 'package:our_apps_template/data/data_provider/user_data_provider.dart';
import 'package:meta/meta.dart';
import 'package:our_apps_template/data/service/shared_preference_service.dart';

class UserRepository {
  UserRepository({@required this.userDataProvider})
      : assert(userDataProvider != null);

  final UserDataProvider userDataProvider;

  Future<void> login(String userId) async {
    final userData = await userDataProvider.loginAndGetUserData(userId);

    // TODO: write user data to database

    // make user logged in
    await (await SharedPreferencesService.instance).setUserLogInfo(true);
  }

  Future<void> register(String userId) async {
    final userData = await userDataProvider.registerAndGetUserData(userId);

    // TODO: write user data to database

    // make user logged in
    await (await SharedPreferencesService.instance).setUserLogInfo(true);
    return true;
  }
}
