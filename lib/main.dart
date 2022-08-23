import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/bloc_observer.dart';
import 'package:la_vie/layout/auth/cubit/cubit.dart';
import 'package:la_vie/layout/auth/mobile_auth_layout.dart';
import 'package:la_vie/layout/home/cubit/cubit.dart';
import 'package:la_vie/layout/home/mobile_home_layout.dart';
import 'package:la_vie/modules/auth/login/mobile_login_screen.dart';

import 'package:la_vie/modules/home/cubit/cubit.dart';
import 'package:la_vie/modules/nav/home/mobile_home_screen.dart';
import 'package:la_vie/shared/cubit/cubit.dart';
import 'package:la_vie/shared/cubit/states.dart';
import 'package:la_vie/shared/network/local/cache_helper.dart';
import 'package:la_vie/shared/network/remote/dio_helper.dart';
import 'package:la_vie/styles/themes.dart';

import 'modules/auth/login/cubit/cubit.dart';
import 'modules/auth/splash/mobile_splash_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await DioHelper.init();
  await CacheHelper.init();


  // String? Id;
  // Id = CacheHelper.getData(key: 'uId');

  Widget widget;
  //
  // if (Id != null) {
  //   widget = const MobileSplashScreen();
  // } else {
  // //  widget = SocialLoginScreen();
  // }
  widget = const MobileSplashScreen();
  BlocOverrides.runZoned(
        () => runApp(
      MyApp(
        false,
        widget,
      ),
    ),
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final bool isDark;
  final Widget startWidget;

  MyApp(this.isDark, this.startWidget);


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()),
        BlocProvider(create: (context) => AuthCubit()),
         BlocProvider(create: (context) => LoginCubit()),
         BlocProvider(create: (context) => HomeLayoutCubit()..refreshToken()),
         BlocProvider(create: (context) => HomeScreenCubit()..getProductsData()),

      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.light,
            home:   const MobileAuthLayout(),
          );
        },
      ),
    );
  }
}
