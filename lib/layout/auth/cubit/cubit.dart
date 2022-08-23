import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/layout/auth/cubit/state.dart';

import '../../../modules/auth/login/mobile_login_screen.dart';
import '../../../modules/auth/register/mobile_register_screen.dart';



class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);

  int currentIndex = 1;

  List<Widget> authScreens = [
    MobileRegisterScreen(),
    MobileLoginScreen(),
  ];


  List<Widget> authTabs = [
    const Tab(child: Text("Sign up")),
    const Tab(child: Text("Login")),
  ];

  void changeBottom({required int index}) {
    currentIndex = index;
    emit(AuthChangeBottomSheetState());
  }




  // bool isDark = false;
  //
  // void changeShopAppTheme({bool? fromShared}) {
  //   if (fromShared != null) {
  //     isDark = fromShared;
  //     emit(ShopAppThemeState());
  //   } else {
  //     isDark = !isDark;
  //     CacheHelper.saveData(key: 'isDark', value: isDark).then((value) {
  //       emit(ShopAppThemeState());
  //     });
  //   }
  // }
  //
  //

}
