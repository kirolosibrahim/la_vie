



import '../../../../models/user_model.dart';


abstract class RegisterStates {}


class RegisterInitialState extends RegisterStates {}
class RegisterLoadingState extends RegisterStates {}
class ChangeRegisterPasswordVisibilityState extends RegisterStates {}
class ChangeRegisterPassword2VisibilityState extends RegisterStates {}


class RegisterSuccessState extends RegisterStates {
 late final UserModel userModel;

 RegisterSuccessState(this.userModel);
}

class RegisterErrorState extends RegisterStates {
 late final String error ;

 RegisterErrorState(this.error);
}


