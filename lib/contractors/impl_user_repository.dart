import 'package:our_apps_template/data/model/user.dart';

abstract class IUserRepository {
  Future<User> login(String userId);
  Future<User> register(String userId);
  Future<User> getUserData(String userId);
}
