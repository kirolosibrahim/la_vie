import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/layout/auth/cubit/cubit.dart';
import 'package:la_vie/layout/auth/cubit/state.dart';
import 'package:la_vie/shared/components/components.dart';
import 'package:la_vie/styles/colors.dart';

class MobileAuthLayout extends StatelessWidget {
  const MobileAuthLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, status) {},
      builder: (context, status) {
        var cubit = AuthCubit.get(context);

        return Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                // TOP LEAVES //
                Container(
                  height: 180,
                  alignment: AlignmentDirectional.topEnd,
                  child: Image.asset('assets/images/leaves-top.png'),
                ),
                // Logo //
                defaultLogo(fontSize: 26),

                Container(
                  height: MediaQuery.of(context).size.height * 0.77,
                  child: DefaultTabController(
                    length: cubit.authScreens.length,
                    initialIndex: 1,
                    child: Column(
                      children: [
                        // TAB BAR //
                        TabBar(
                          labelPadding: const EdgeInsets.symmetric(horizontal: 50),
                          isScrollable: true,
                          indicatorSize: TabBarIndicatorSize.label,
                          labelColor: primaryColor,
                          unselectedLabelColor: Colors.grey,
                          tabs: cubit.authTabs,
                        ),
                        Expanded(
                          child: TabBarView(
                            children: cubit.authScreens,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // BOTTOM LEAVES //
                Container(
                  alignment: AlignmentDirectional.bottomStart,
                  child: Image.asset('assets/images/leaves-bottom.png'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
