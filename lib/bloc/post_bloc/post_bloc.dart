import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_apps_template/data/model/post.dart';
import 'package:equatable/equatable.dart';
import 'package:our_apps_template/data/repository/post_repository.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';

part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({@required this.postRepository}) : assert(postRepository != null);

  final PostRepository postRepository;

  @override
  PostState get initialState => PostLoadUninitialized();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is FetchPostsRequested) {
      yield* _mapFetchPostRequestedToState();
    }
  }

  Stream<PostState> _mapFetchPostRequestedToState() async* {
    yield PostLoadInProgress();

    try {
      final posts = await postRepository.getAllPosts();
      yield PostLoadSuccess(posts);
    } catch(e) {
      yield PostLoadFailure(e.toString());
    }
  }
}
