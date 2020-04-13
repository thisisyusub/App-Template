import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_apps_template/bloc/home_bloc//home_bloc.dart';
import 'package:our_apps_template/bloc/theme_bloc/theme_bloc.dart';
import 'package:our_apps_template/data/model/post.dart';
import 'package:our_apps_template/data/model/user.dart';
import 'package:our_apps_template/presentation/shared/app_text_styles.dart';
import 'package:our_apps_template/presentation/widgets/custom_drawer.dart';

class HomePage extends StatelessWidget {
  final User user;

  HomePage(this.user) : assert(user != null);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: BlocProvider.value(
        value: context.bloc<ThemeBloc>(),
        child: CustomDrawer(user),
      ),
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, postState) {
          if (postState is PostLoadFailure) {
            _buildPostLoadFailureWidget(postState);
          } else if (postState is PostLoadInProgress) {
            return _buildPostLoadInProgressWidget();
          } else if (postState is PostLoadSuccess) {
            return PostSuccessWidget(postState.posts);
          }

          return Container();
        },
      ),
    );
  }

  Widget _buildPostLoadInProgressWidget() {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.white,
      ),
    );
  }

  Widget _buildPostLoadFailureWidget(PostLoadFailure postLoadFailure) {
    return Center(
      child: Text(
        postLoadFailure.message,
        style: AppTextStyles.mediumTextStyle,
      ),
    );
  }
}

class PostSuccessWidget extends StatelessWidget {
  final List<Post> posts;

  PostSuccessWidget(this.posts);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
          color: Colors.white,
          child: Card(
            margin: EdgeInsets.zero,
            child: ListTile(
              contentPadding: const EdgeInsets.all(8.0),
              leading: CircleAvatar(
                child: Text(posts[index].userId.toString()),
              ),
              title: Text(posts[index].title),
              subtitle: Text(posts[index].body),
              trailing: IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {},
              ),
              isThreeLine: true,
            ),
          ),
        ),
        itemCount: posts.length,
      ),
    );
  }
}
