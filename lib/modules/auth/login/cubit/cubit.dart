import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/models/user_model.dart';
import 'package:la_vie/modules/auth/login/cubit/state.dart';

import '../../../../shared/components/components.dart';
import '../../../../shared/network/local/cache_helper.dart';
import '../../../../shared/network/remote/dio_helper.dart';
import '../../../../shared/network/remote/end_points.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  UserModel? userModel;

  userLogin( {
    required String Email,
    required String Password,
    required bool RememberMe,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data: {
        'password': Password,
        'email': Email,
      },
    ).then((value) {
      userModel = UserModel.fromJson(value.data);
      emit(LoginSuccessState(userModel!));

      if (RememberMe) {
        CacheHelper.saveData(key: 'email', value: Email);
        CacheHelper.saveData(key: 'password', value:  Password);
        emit(SuccessSaveUserDataState());
      }

    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
      print(error.toString());
      showToast(text: error.toString(), state: ToastStates.ERROR);
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }

  bool rememberMe = false;

  void changeRememberMe() {
    rememberMe = !rememberMe;
    emit(ChangeRememberMeState());
  }
}
