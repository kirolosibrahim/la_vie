import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../shared/components/components.dart';
import '../../../styles/colors.dart';
import '../../home/cubit/cubit.dart';
import '../../home/cubit/state.dart';

class MobileHomeScreen extends StatelessWidget {
  const MobileHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();

    return BlocConsumer<HomeScreenCubit, HomeScreenStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeScreenCubit.get(context);

        return Scaffold(
          body: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              // Logo //
              defaultLogo(fontSize: 27),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        decoration: InputDecoration(
                            filled: true,
                            alignLabelWithHint: true,
                            hintStyle: TextStyle(
                              fontSize: 15,
                              color: HexColor('979797'),
                            ),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            hintText: "Search",
                            prefixStyle: TextStyle(color: HexColor('979797')),
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide:
                                    BorderSide.none)), // InputDecoration
                      ), // TextField
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const ImageIcon(
                        AssetImage('assets/images/cart-icon.png'),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: DefaultTabController(
                  length: 4,
                  child: Column(
                    children: [
                      // TAB BAR //
                      Container(
                        height: kToolbarHeight - 8.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 20.0),
                          child: TabBar(
                            physics: const BouncingScrollPhysics(),
                            // indicatorSize: TabBarIndicatorSize.label,
                            labelColor: primaryColor,
                            unselectedLabelColor: Colors.grey,
                            indicator: BoxDecoration(
                              border: Border.all(color: primaryColor),
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.white,
                            ),

                            tabs: cubit.homeTabs,
                          ),
                        ),
                      ),
                      // TAB BAR VIEWS //
                      Expanded(
                        child: TabBarView(
                          physics: const BouncingScrollPhysics(),
                          children: cubit.homeScreens,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
