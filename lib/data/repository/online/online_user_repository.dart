import 'package:our_apps_template/contractors/impl_user_repository.dart';
import 'package:our_apps_template/data/model/user.dart';
import 'package:our_apps_template/data/service/api_service.dart';
import 'package:our_apps_template/utils/exceptions/exceptions.dart';

class OnlineUserRepository implements IUserRepository {
  final _apiService = ApiService();

  @override
  Future<User> login(String userId) async {
    String endPoint = '/users';
    final result = await _apiService.dio.get(endPoint);
    if (result.statusCode == 200) {
      final converted = result.data.map((x) => User.fromJson(x)).toList();

      for (int eachUser = 0; eachUser < converted.length; eachUser++) {
        if (converted[eachUser].id.toString() == userId) {
          return converted[eachUser];
        }
      }

      throw UserNotFoundException();
    } else {
      throw HttpException('Error occured with ${result.statusCode}');
    }
  }

  /// It is the same because it is fake API :)
  @override
  Future<User> register(String userId) async {
    String endPoint = '/users';
    final result = await _apiService.dio.get(endPoint);
    if (result.statusCode == 200) {
      final converted = result.data.map((x) => User.fromJson(x)).toList();

      for (int eachUser = 0; eachUser < converted.length; eachUser++) {
        if (converted[eachUser].id.toString() == userId) {
          return converted[eachUser];
        }
      }

      throw RegistrationFaultException('User registration is failed!');
    } else {
      throw HttpException('Error occured with ${result.statusCode}');
    }
  }

  @override
  Future<User> getUserData(String userId) {
    return login(userId);
  }
}
