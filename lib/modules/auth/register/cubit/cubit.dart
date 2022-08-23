import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/modules/auth/register/cubit/state.dart';


import '../../../../models/user_model.dart';
import '../../../../shared/network/remote/dio_helper.dart';
import '../../../../shared/network/remote/end_points.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  UserModel? userModel;


  userRegister({
    required String FName,
    required String LName,
    required String Email,

    required String Password,
  }) {
    emit(RegisterLoadingState());
    DioHelper.postData(
      url: REGISTER,
      data: {
        'firstName': FName,
        'lastName': LName,
        'email': Email,
        'password': Password,
      },
    ).then((value) {
      userModel = UserModel.fromJson(value.data);

      emit(RegisterSuccessState(userModel!));
    }).catchError((error) {

      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }


  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangeRegisterPasswordVisibilityState());
  }

  IconData suffix2 = Icons.visibility_outlined;
  bool isPassword2 = true;

  void changePassword2Visibility() {
    isPassword2 = !isPassword2;
    suffix = isPassword2 ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangeRegisterPassword2VisibilityState());
  }
}