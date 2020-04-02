import 'package:our_apps_template/data/data_provider/post_data_provider.dart';
import 'package:meta/meta.dart';
import 'package:our_apps_template/data/model/post.dart';

class PostRepository {
  PostRepository({@required this.postDataProvider})
      : assert(postDataProvider != null);

  final PostDataProvider postDataProvider;

  Future<List<Post>> getAllPosts() async {
    final result = await postDataProvider.getAllPost();
    return result;
  }
}
