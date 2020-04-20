import 'package:our_apps_template/data/model/post.dart';

abstract class ImplPostRepository {
  Future<List<Post>> getAllPosts();
}
