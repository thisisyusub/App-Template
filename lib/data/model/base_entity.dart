abstract class EntityBase {
  int id;

  EntityBase(this.id);

  EntityBase.fromJson(Map<String, dynamic> json) : id = json['id'];
}
