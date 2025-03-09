sealed class HomeAccountEvent {}

final class GetUsersEvent extends HomeAccountEvent {
  GetUsersEvent();
}

final class UserLogoutEvent extends HomeAccountEvent {
  UserLogoutEvent();
}

