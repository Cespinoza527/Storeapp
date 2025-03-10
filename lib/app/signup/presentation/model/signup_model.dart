import 'package:appstore/app/core/domain/entity/user_entity.dart';

class SignupModel {
  final String id;
  final String user;
  final String email;
  final String password;
  final String image;
  SignupModel({
    required this.id,
    required this.user,
    required this.email,
    required this.password,
    required this.image,
  });

  SignupModel copyWith({
    String? id,
    String? user,
    String? email,
    String? password,
    String? image,
  }) {
    return SignupModel(
      id: id ?? this.id,
      user: user ?? this.user,
      email: email ?? this.email,
      password: password ?? this.password,
      image: image ?? this.image,
    );
  }

  UserEntity toEntity() => UserEntity(
    id: id,
    user: user,
    email: email,
    password: password,
    image: image
  );
}
