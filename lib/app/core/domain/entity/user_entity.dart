
import 'package:appstore/app/core/data/remote/dto/user_data_model.dart';
import 'package:appstore/app/home_account/presentation/model/account_model.dart';

final class UserEntity {
  final String id;
  final String user;
  final String email;
  final String image;
  final String password;

  UserEntity({
    required this.id,
    required this.user,
    required this.email,
    required this.image,
    required this.password,
  });

  AccountModel toUserModel() {
    return AccountModel(id: id, user: user, email: email, urlImage: image, password: password);
  }

  UserDataModel toUserDataModel() {
    return UserDataModel(id: id, user: user, email: email, imageUrl: image, password: password);
  }
}
