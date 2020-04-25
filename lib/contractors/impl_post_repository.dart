import 'package:our_apps_template/data/model/post.dart';

abstract class IPostRepository {
  Future<List<Post>> getAllPosts();
}
