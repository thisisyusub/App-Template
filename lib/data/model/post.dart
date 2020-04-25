import 'package:our_apps_template/utils/constants/constants.dart'
    show DatabaseKeys;

class Post {
  int userId;
  int id;
  String title;
  String body;

  Post({this.userId, this.id, this.title, this.body});

  Post.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toMap() => {
        '${DatabaseKeys.postId}': id,
        '${DatabaseKeys.userId}': userId,
        '${DatabaseKeys.title}': title,
        '${DatabaseKeys.body}': body,
      };

  @override
  String toString() => '''
  ${DatabaseKeys.postId} : $id,
  ${DatabaseKeys.userId} : $userId,
  ${DatabaseKeys.title} : $title,
  ${DatabaseKeys.body} : $body,
  ''';
}
