import 'package:appstore/app/core/domain/use_case/logout_use_case.dart';
import 'package:appstore/app/home_account/domain/use_case/get_users_use_case.dart';
import 'package:appstore/app/home_account/presentation/bloc/home_account_event.dart';
import 'package:appstore/app/home_account/presentation/bloc/home_account_state.dart';
import 'package:appstore/app/home_account/presentation/model/account_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeAccountBloc extends Bloc<HomeAccountEvent, HomeAccountState> {
  final GetUsersUseCase getUsersUseCase;
  final LogoutUseCase logoutUseCase;

  HomeAccountBloc({
    required this.getUsersUseCase,
    required this.logoutUseCase,
  }) : super(UserLoadingState()) {
    on<GetUsersEvent>(_getUsersEvent);
    on<UserLogoutEvent>(_logoutEvent);
  }

  void _getUsersEvent(
    GetUsersEvent event,
    Emitter<HomeAccountState> emit,
  ) async {
    late HomeAccountState newState;
    try {
      newState = UserLoadingState();
      emit(newState);

      final List<AccountModel> result = await getUsersUseCase.invoke();

      if (result.isEmpty) {
        newState = UserEmptyState();
      } else {
        newState = UserLoadDataState(model: state.model.copyWith(users: result));
      }
    } catch (e) {
      newState = UserHomeErrorState(
        model: state.model,
        message: "Error al obtener los usuarios",
      );
    }

    emit(newState);
  }

  void _logoutEvent(UserLogoutEvent event, Emitter<HomeAccountState> emit) async {
    logoutUseCase.invoke();

    emit(UserLogoutState());
  }
}
