import 'package:our_apps_template/contractors/i_repository.dart';
import 'package:our_apps_template/data/model/post.dart';

abstract class IPostRepository extends IRepository {
  Future<List<Post>> getAllPosts();
}
