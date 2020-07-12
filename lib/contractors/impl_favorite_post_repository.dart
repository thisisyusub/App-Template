import './base_repository.dart';
import '../data/model/post.dart';

abstract class IFavoritePostRepository extends IBaseRepository {
  List<Post> getAllPosts();

  bool addPost(Post newPost);
}
