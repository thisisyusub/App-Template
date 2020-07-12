import '../../../data/model/post.dart';
import '../../../contractors/impl_favorite_post_repository.dart';

class OfflineFavoritePostRepository implements IFavoritePostRepository {
  final List<Post> _favoritePosts = [];

  @override
  bool addPost(Post newPost) {
    _favoritePosts.add(newPost);
    return _favoritePosts.contains(newPost);
  }

  @override
  List<Post> getAllPosts() => [..._favoritePosts];
}
