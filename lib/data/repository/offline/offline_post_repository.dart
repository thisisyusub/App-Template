import 'package:our_apps_template/contractors/impl_post_repository.dart';
import 'package:our_apps_template/data/model/post.dart';

class OfflinePostRepository implements IPostRepository {
  @override
  Future<List<Post>> getAllPosts() {
    // TODO: read from database
    return null;
  }
}
