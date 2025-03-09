import 'package:appstore/app/core/domain/entity/user_entity.dart';

class UserDataModel {
  final String id;
  late final String user;
  late final String email;
  late final String password;
  late final String imageUrl;

  UserDataModel({
    required this.id,
    required this.user,
    required this.email,
    required this.password,
    required this.imageUrl,
  });

  UserDataModel.fromJson(this.id, Map<String, dynamic> json) {
    user = json["user"];
    email = json["email"];
    password = json["password"];
    imageUrl = json["image"];
  }

  UserEntity toEntity() {
    return UserEntity(id: id, user: user, email:email, image: imageUrl, password: password);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "user":user,
      "email":email,
      "password":password,
      "image":imageUrl,
    };
  }
}
