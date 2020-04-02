import 'package:our_apps_template/data/model/post.dart';
import 'package:our_apps_template/data/service/api_service.dart';
import 'package:our_apps_template/utils/exceptions.dart';

class PostDataProvider {
  final _apiService = ApiService();

  /// Method is used to get posts
  /// all posts are shown in home screen
  Future<List<Post>> getAllPost() async {
    String endPoint = '/posts';
    final result = await _apiService.dio.get(endPoint);

    if (result.statusCode == 200) {
      final converted = result.data.map<Post>((x) => Post.fromJson(x)).toList();
      return converted;
    } else {
      throw HttpException('Error occured with ${result.statusCode}');
    }
  }
}
