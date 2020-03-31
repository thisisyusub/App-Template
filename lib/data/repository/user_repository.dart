import 'package:our_apps_template/data/exceptions/http_exception.dart';
import 'package:our_apps_template/data/model/user.dart';
import 'package:our_apps_template/data/service/api_service.dart';

class UserRepository {
  final _apiService = ApiService();

  /// Method is used to login user by his/her id
  /// it search in users from json placeholder api
  /// and return result
  Future<bool> loginUser(String userId) async {
    String endPoint = '/users';
    try {
      final result = await _apiService.dio.get(endPoint);
      if (result.statusCode == 200) {
        final converted = result.data.map((x) => User.fromJson(x)).toList();

        for (int eachUser = 0; eachUser < converted.length; eachUser++) {
          if (converted[eachUser].id.toString() == userId) {
            return true;
          }
        }

        return false;
      } else {
        throw HttpException('Error occured with ${result.statusCode}');
      }
    } catch (e) {
      throw HttpException(e);
    }
  }

  /// It is the same because it is fake API :)
  Future<bool> registerUser(String userId) async {
    String endPoint = '/users';
    try {
      final result = await _apiService.dio.get(endPoint);
      if (result.statusCode == 200) {
        final converted = result.data.map((x) => User.fromJson(x)).toList();

        for (int eachUser = 0; eachUser < converted.length; eachUser++) {
          if (converted[eachUser].id.toString() == userId) {
            return true;
          }
        }

        return false;
      } else {
        throw HttpException('Register rrror occured with ${result.statusCode}');
      }
    } catch (e) {
      throw HttpException(e);
    }
  }
}
