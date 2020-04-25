import 'package:our_apps_template/contractors/impl_post_repository.dart';
import 'package:our_apps_template/data/model/post.dart';
import 'package:our_apps_template/data/service/api_service.dart';
import 'package:our_apps_template/utils/exceptions/exceptions.dart';

class OnlinePostRepository extends IPostRepository {
  final _apiService = ApiService();

  @override
  Future<List<Post>> getAllPosts() async {
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
