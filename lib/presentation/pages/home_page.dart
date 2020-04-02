import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_apps_template/bloc/post_bloc/post_bloc.dart';
import 'package:our_apps_template/presentation/dialogs/log_out_dialog.dart';
import 'package:our_apps_template/presentation/shared/app_text_styles.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (context) => LogOutDialog(),
                barrierDismissible: false,
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, postState) {
          if (postState is PostLoadFailure) {
            _buildPostLoadFailureWidget(postState);
          } else if (postState is PostLoadInProgress) {
            return _buildPostLoadInProgressWidget();
          } else if (postState is PostLoadSuccess) {
            return _buildPostLoadSuccessWidget(postState);
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

  Widget _buildPostLoadSuccessWidget(PostLoadSuccess postLoadSuccess) {
    final posts = postLoadSuccess.posts;

    return Scrollbar(
      child: ListView.separated(
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
          color: Colors.white,
          child: ListTile(
            contentPadding: const EdgeInsets.all(8.0),
            leading: CircleAvatar(
              child: Text(posts[index].userId.toString()),
            ),
            title: Text(posts[index].title),
            subtitle: Text(posts[index].body),
            trailing: CircleAvatar(
              child: Text(posts[index].id.toString()),
            ),
            isThreeLine: true,
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(
          height: 5,
        ),
        itemCount: posts.length,
      ),
    );
  }
}
