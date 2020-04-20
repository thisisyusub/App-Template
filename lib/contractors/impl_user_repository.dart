import 'package:our_apps_template/data/model/user.dart';

abstract class ImplUserRepository {
  Future<User> login(String userId);

  Future<User> register(String userId);
}
