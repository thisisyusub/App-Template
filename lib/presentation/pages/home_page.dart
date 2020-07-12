/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusub@gmail.com>, July 2020
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/theme_bloc/theme_bloc.dart';
import '../../bloc/home_bloc/home_bloc.dart';
import '../../bloc/home_bloc/home_state.dart';
import '../../data/model/post.dart';
import '../../data/model/user.dart';
import '../shared/app_text_styles.dart';
import '../widgets/custom_drawer.dart';
import '../../utils/constants/constants.dart';
import '../../utils/extensions/translation_extension.dart';

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
        title: Text(LanguageKeys.homePage).translate(context),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () => Navigator.of(context).pushNamed(Routes.favorites),
          ),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
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
                icon: Icon(
                  posts[index].isFavorite == 1
                      ? Icons.favorite
                      : Icons.favorite_border,
                ),
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
