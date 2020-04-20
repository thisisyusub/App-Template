import 'package:our_apps_template/contractors/impl_user_repository.dart';
import 'package:our_apps_template/data/data_provider/user_data_provider.dart';
import 'package:meta/meta.dart';
import 'package:our_apps_template/data/model/user.dart';
import 'package:our_apps_template/data/service/shared_preference_service.dart';
import 'package:our_apps_template/utils/constants.dart';

class UserRepository implements ImplUserRepository {
  UserRepository({@required this.userDataProvider})
      : assert(userDataProvider != null);

  final UserDataProvider userDataProvider;

  @override
  Future<User> login(String userId) async {
    final userData = await userDataProvider.loginAndGetUserData(userId);

    // TODO: write user data to database
    final sharedPrefService = await SharedPreferencesService.instance;

    sharedPrefService.persistUserId(userData.id);
    sharedPrefService.setUsername(userData.username);
    sharedPrefService.setUserEmail(userData.email);

    // make user logged in
    await (await SharedPreferencesService.instance).setUserLogInfo(true);

    return userData;
  }

  @override
  Future<User> register(String userId) async {
    final userData = await userDataProvider.registerAndGetUserData(userId);

    // TODO: write user data to database
    final sharedPrefService = await SharedPreferencesService.instance;

    sharedPrefService.persistUserId(userData.id);
    sharedPrefService.setUsername(userData.username);
    sharedPrefService.setUserEmail(userData.email);

    // make user logged in
    await (await SharedPreferencesService.instance).setUserLogInfo(true);
    return userData;
  }

  /// Method is sed to get user information
  Future<Map<String, dynamic>> getUserData() async {
    final sharedPrefService = await SharedPreferencesService.instance;
    return {
      SharedPrefKeys.id: sharedPrefService.userId,
      SharedPrefKeys.username: sharedPrefService.username,
      SharedPrefKeys.email: sharedPrefService.userEmail,
    };
  }
}
