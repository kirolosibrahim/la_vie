import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/layout/home/cubit/state.dart';
import 'package:la_vie/layout/home/mobile_home_layout.dart';
import 'package:la_vie/modules/nav/home/mobile_home_screen.dart';
import 'package:la_vie/modules/nav/leave/mobile_leave_screen.dart';
import 'package:la_vie/modules/nav/notifications/mobile_notification_screen.dart';
import 'package:la_vie/modules/nav/scanner/mobile_scanner_screen.dart';

import '../../../models/user_model.dart';
import '../../../modules/nav/profile/mobile_profile_screen.dart';
import '../../../shared/components/components.dart';
import '../../../shared/cubit/states.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../../../shared/network/remote/dio_helper.dart';
import '../../../shared/network/remote/end_points.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutStates> {
  HomeLayoutCubit() : super(HomeInitialState());

  static HomeLayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 2;
  List<Widget> screens = [
    MobileLeaveScreen(),
    const MobileScannerScreen(),
   const MobileHomeScreen(),
    const MobileNotificationScreen(),
    const MobileProfileScreen(),
  ];
  List<String> titles = [
    'Leave',
    'Scanner',
    'Home',
    'Notification',
    'Profile',
  ];
  List<BottomNavigationBarItem> navBottomItems =   [

        const BottomNavigationBarItem(label :'Leave',icon:  ImageIcon(AssetImage('assets/images/leave-icon.png'),),),
        const BottomNavigationBarItem(label : 'Scanner',icon:  ImageIcon(AssetImage('assets/images/qr-icon.png'),),),
        const BottomNavigationBarItem(label : 'Home',icon:  ImageIcon(AssetImage('assets/images/qr-icon.png'),color: Colors.white,),),
        const BottomNavigationBarItem(label : 'Notification',icon:  ImageIcon(AssetImage('assets/images/notification-icon.png'),),),
        const BottomNavigationBarItem(label : 'Profile',icon:  ImageIcon(AssetImage('assets/images/profile-icon.png'),),),


  ];

  UserModel? userRefreshTokenModel;
  refreshToken() {
    emit(LoadingRefreshTokenModelState());
    String Email=CacheHelper.getData(key: 'email');
    String Password= CacheHelper.getData(key: 'password');

    DioHelper.postData(
      url: LOGIN,
      data: {
        'password': Password,
        'email': Email,
      },
    ).then((value) {
      userRefreshTokenModel = UserModel.fromJson(value.data);
      CacheHelper.removeData(key: 'atoken');
      CacheHelper.removeData(key: 'rtoken');
      CacheHelper.saveData(key: 'atoken', value: userRefreshTokenModel!.data!.accessToken);
      CacheHelper.saveData(key: 'rtoken', value: userRefreshTokenModel!.data!.refreshToken);
      emit(SuccessRefreshTokenModelState(userRefreshTokenModel!));
    }).catchError((error) {
      emit(ErrorRefreshTokenModelState(error.toString()));
      print(error.toString());
      showToast( text: error.toString(), state: ToastStates.ERROR);
    });
  }

  void changeBottomNav(int index) {
  currentIndex = index;
  emit(HomeChangeBottomSheetState());
}


  }
