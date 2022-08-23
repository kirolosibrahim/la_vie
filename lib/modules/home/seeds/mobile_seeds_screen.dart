import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/components/home_screen/product_grid_builder.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';


class MobileSeedsScreen extends StatelessWidget {
  const MobileSeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenCubit,HomeScreenStates>(

      listener: (context,state){},
      builder: (context,state){
        var cubit = HomeScreenCubit.get(context);


        return Scaffold(
          body: ConditionalBuilder(
            condition: state is! LoadingSeedDataState ,
            builder: (context) => ProductGridBuilder(cubit.seedModel! , context),
            fallback: (context) => const Center(child: CircularProgressIndicator()),
          ),
        );
      },

    );
  }
}
