/*
 * Copyright (c) 2020, Kanan Yusubov. - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential
 * Written by: Kanan Yusubov <kanan.yusub@gmail.com>, July 2020
 */

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../model/post.dart';
import '../../utils/constants/constants.dart' show DatabaseKeys;

class DatabaseService {
  static DatabaseService _instance;
  static Database _database;

  DatabaseService._internal();

  static Future<DatabaseService> get instance async {
    if (_instance == null) {
      _instance = DatabaseService._internal();
    }

    if (_database == null) {
      Directory documentsDirectory = await getApplicationDocumentsDirectory();
      String path = documentsDirectory.path + "Template.db";

      _database = await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
        await db.execute('''
          create table ${DatabaseKeys.postTable} (
          ${DatabaseKeys.postId} integer primary key,
          ${DatabaseKeys.userId} integer not null,
          ${DatabaseKeys.title} text not null,
          ${DatabaseKeys.body} text not null,
          ${DatabaseKeys.isFavorite} integer not null )''');

        print('Post database was crated');

        await db.execute('''
          create table ${DatabaseKeys.commentTable} (
          ${DatabaseKeys.postId} integer primary key,
          ${DatabaseKeys.userId} integer not null,
          ${DatabaseKeys.title} text not null,
          ${DatabaseKeys.body} integer not null)''');
      });

      print('Comment database was crated');
    }
    return _instance;
  }

  Future<int> insertPost(Post post) async {
    post.id = await _database.insert(DatabaseKeys.postTable, post.toMap());
    return post.id;
  }

  Future<Post> getPost(int postId) async {
    var result = await _database.query(DatabaseKeys.postTable,
        where: '${DatabaseKeys.postId} = ?', whereArgs: [DatabaseKeys.postId]);

    return result.isNotEmpty ? Post.fromJson(result.first) : Null;
  }

  Future<int> updatePost(Post post) async {
    var result = await _database.update(
      DatabaseKeys.postTable,
      post.toMap(),
      where: '${DatabaseKeys.postId} = ?',
      whereArgs: [DatabaseKeys.postId],
    );

    return result;
  }

  Future<List<Post>> getAllPosts() async {
    var result = await _database.query(DatabaseKeys.postTable);

    List<Post> posts = result.isNotEmpty
        ? result.map((post) => Post.fromMap(post)).toList()
        : [];

    return posts;
  }

  Future<void> deletePost(int postId) => _database.delete(
        DatabaseKeys.postTable,
        where: '${DatabaseKeys.postId} = ?',
        whereArgs: [DatabaseKeys.postId],
      );

  Future<void> deleteAllPosts() =>
      _database.rawDelete('Delete * from ${DatabaseKeys.postTable}');
}
