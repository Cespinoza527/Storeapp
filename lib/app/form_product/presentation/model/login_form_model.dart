import 'package:appstore/app/login/domain/entity/login_entity.dart';

class LoginForModel {
  final String email;
  final String password;
  LoginForModel({required this.email, required this.password});

  LoginForModel copyWith({String? email, String? password}) {
    return LoginForModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  LoginEntity toEntity() =>
      LoginEntity(email: this.email, password: this.password);
}
