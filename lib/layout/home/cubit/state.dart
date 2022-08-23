import '../../../models/user_model.dart';

abstract class HomeLayoutStates {}

class HomeInitialState extends HomeLayoutStates {}

class HomeChangeBottomNavBarState extends HomeLayoutStates {}

class HomeChangeBottomSheetState extends HomeLayoutStates {}


class ErrorRefreshTokenModelState extends HomeLayoutStates {
  late final String error ;

  ErrorRefreshTokenModelState(this.error);
}
class LoadingRefreshTokenModelState extends HomeLayoutStates {}
class SuccessRefreshTokenModelState extends HomeLayoutStates {
  late final UserModel userModel;

  SuccessRefreshTokenModelState(this.userModel);
}