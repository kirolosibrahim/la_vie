



import 'package:la_vie/models/user_model.dart';

abstract class LoginStates {}


class LoginInitialState extends LoginStates {}
class LoginLoadingState extends LoginStates {}
class LoginSuccessState extends LoginStates {
 late final UserModel userModel;

 LoginSuccessState(this.userModel);
}

class SuccessSaveUserDataState extends LoginStates {}



class LoginErrorState extends LoginStates {
 late final String error ;

 LoginErrorState(this.error);
}


class ChangePasswordVisibilityState extends LoginStates {}
class ChangeRememberMeState extends LoginStates {}