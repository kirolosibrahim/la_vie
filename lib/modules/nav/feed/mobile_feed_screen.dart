import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:la_vie/modules/feed/cubit/state.dart';

import '../../../shared/components/custom_logo/custom_logo.dart';
import '../../../styles/colors.dart';
import '../../feed/cubit/cubit.dart';

class MobileFeedScreen extends StatelessWidget {
  const MobileFeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();

    return BlocConsumer<FeedScreenCubit, FeedScreenStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = FeedScreenCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: const Text('Discussion Forums'),
          ),
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
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: DefaultTabController(
                  length: cubit.feedTabs.length,
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
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.grey,
                            indicator: BoxDecoration(
                              border: Border.all(color: primaryColor),
                              borderRadius: BorderRadius.circular(8.0),
                              color: primaryColor,
                            ),

                            tabs: cubit.feedTabs,
                          ),
                        ),
                      ),
                      // TAB BAR VIEWS //
                      Expanded(
                        child: TabBarView(
                          physics: const BouncingScrollPhysics(),
                          children: cubit.feedScreens,
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
