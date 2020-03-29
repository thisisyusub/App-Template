import 'package:our_apps_template/data/exceptions/http_exception.dart';
import 'package:our_apps_template/data/model/user.dart';
import 'package:our_apps_template/data/service/api_service.dart';

class UserRepository {
  final _apiService = ApiService();

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
        throw HttpException('Erroe occured with ${result.statusCode}');
      }
    } catch (e) {
      throw HttpException(e);
    }
  }
}
