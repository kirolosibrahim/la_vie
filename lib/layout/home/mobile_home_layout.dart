import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/modules/auth/login/cubit/cubit.dart';
import 'package:la_vie/modules/auth/login/cubit/state.dart';
import 'package:la_vie/styles/colors.dart';
import '../../shared/network/local/cache_helper.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';

class MobileHomeLayout extends StatelessWidget {
  const MobileHomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
      listener: (context, state) {
        if (state is SuccessSaveUserDataState) {
          HomeLayoutCubit.get(context).userRefreshTokenModel;
        }
      },
      builder: (context, state) {
        var cubit = HomeLayoutCubit.get(context);
        return Scaffold(
          extendBody: true,
          body: cubit.screens[cubit.currentIndex],
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor: primaryColor,
            onPressed: () {
              cubit.changeBottomNav(2);
            },
            child: const ImageIcon(
              AssetImage('assets/images/home-icon.png'),
              color: Colors.white,
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            // ****** APP BAR ******************
            shape: const CircularNotchedRectangle(),
            // ← carves notch for FAB in BottomAppBar
            color: Colors.white,
            // ↑ use .withAlpha(0) to debug/peek underneath ↑ BottomAppBar
            elevation: 0,
            // ← removes slight shadow under FAB, hardly noticeable
            // ↑ default elevation is 8. Peek it by setting color ↑ alpha to 0
            child: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNav(index);
              },
              // ***** NAVBAR  *************************
              elevation: 0,
              // 0 removes ugly rectangular NavBar shadow
              // CRITICAL ↓ a solid color here destroys FAB notch. Use alpha 0!
              backgroundColor: Colors.white,
              unselectedItemColor: Colors.black,
              // ====================== END OF INTERESTING STUFF =================
              selectedItemColor: primaryColor,
              items: cubit.navBottomItems,
            ),
          ),
        );
      },
    );
  }
}
