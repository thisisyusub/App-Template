import 'package:our_apps_template/data/model/user.dart';
import 'package:our_apps_template/data/service/api_service.dart';
import 'package:our_apps_template/data/service/shared_preference_service.dart';
import 'package:our_apps_template/utils/exceptions.dart';

class UserDataProvider {
  final _apiService = ApiService();

  /// Method is used to login user by his/her id
  /// it search in users from json placeholder api
  /// and return result
  Future<User> loginAndGetUserData(String userId) async {
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
  Future<User> registerAndGetUserData(String userId) async {
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
}
