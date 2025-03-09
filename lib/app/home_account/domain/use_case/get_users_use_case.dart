import 'package:appstore/app/home_account/domain/repository/home_account_repository.dart';
import 'package:appstore/app/home_account/presentation/model/account_model.dart';

class GetUsersUseCase {
  final HomeAccountRepository homeAccountRepository;

  GetUsersUseCase({required this.homeAccountRepository});

  Future <List<AccountModel>> invoke() async{
    final List<AccountModel> users = [];

    try {
        final result = await homeAccountRepository.getUsers();
    for (var element in result) {
      users.add(element.toUserModel());
    }  
    } catch (e) {
      throw(Exception(e));
    }

    return users;
  }
}
