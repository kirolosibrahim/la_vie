import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/models/data_model.dart';
import 'package:la_vie/modules/home/cubit/cubit.dart';
import 'package:la_vie/modules/home/cubit/state.dart';

import '../../../shared/components/home_screen/product_grid_builder.dart';

class MobileProductsScreen extends StatelessWidget {
  const MobileProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenCubit, HomeScreenStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeScreenCubit.get(context);


        return Scaffold(
          body: ConditionalBuilder(
            condition: state is! LoadingProductsDataState,
            builder: (context) =>
                ProductGridBuilder(cubit.productModel!.data, context),
            fallback: (context) =>
                const Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
