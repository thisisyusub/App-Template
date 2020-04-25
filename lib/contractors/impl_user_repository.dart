import 'package:our_apps_template/contractors/i_repository.dart';
import 'package:our_apps_template/data/model/user.dart';

abstract class IUserRepository extends IRepository {
  Future<User> login(String userId);

  Future<User> register(String userId);

  Future<User> getUserData(String userId);
}
