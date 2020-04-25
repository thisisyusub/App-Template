import 'package:our_apps_template/data/model/base_entity.dart';

class PostEntity extends EntityBase {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostEntity({this.userId, this.id, this.title, this.body}) : super(id);

  PostEntity.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        id = json['id'],
        title = json['title'],
        body = json['body'],
        super.fromJson(json);

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'id': id,
        'title': title,
        'body': body,
      };
}
