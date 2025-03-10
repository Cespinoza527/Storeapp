//import 'package:appstore/app/login/data/repository/login_repository_impl.dart';
import 'package:appstore/app/core/domain/entity/user_entity.dart';
import 'package:appstore/app/signup/domain/repository/signup_repository.dart';
import 'package:appstore/app/signup/presentation/model/signup_model.dart';

class GetUserUseCase {
  final SignupRepository signupRepository;

  GetUserUseCase({required this.signupRepository});

  Future<SignupModel> invoke(String id) async {
    try {
      final UserEntity data = await signupRepository.getUser(id);

      return SignupModel(
        id: id,
        user: data.user,
        email: data.email,
        password: data.password,
        image: data.image,
      );
    } catch (e) {
      throw (Exception());
    }
  }
}
