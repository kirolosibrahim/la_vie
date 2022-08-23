import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/models/data_model.dart';
import 'package:la_vie/models/plant_model.dart';

import 'package:la_vie/models/product_model.dart';
import 'package:la_vie/models/seeds_model.dart';

import 'package:la_vie/modules/home/cubit/state.dart';
import 'package:la_vie/modules/home/planets/mobile_planet_screen.dart';
import 'package:la_vie/modules/home/products/mobile_products_screen.dart';
import 'package:la_vie/modules/home/seeds/mobile_seeds_screen.dart';
import 'package:la_vie/modules/home/tools/mobile_tools_screen.dart';
import 'package:la_vie/shared/network/local/cache_helper.dart';

import '../../../shared/network/remote/dio_helper.dart';
import '../../../shared/network/remote/end_points.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates> {
  HomeScreenCubit() : super(HomeInitialState());

  static HomeScreenCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> homeScreens = [
    const MobileProductsScreen(),
    const MobilePlanetsScreen(),
    const MobileSeedsScreen(),
    const MobileToolsScreen(),
  ];

  List<Widget> homeTabs = [
    const Tab(
      child: Text("All"),
    ),
    const Tab(child: Text("Planets")),
    const Tab(child: Text("Seeds")),
    const Tab(child: Text("Tools")),
  ];

  void changeBottom({required int index}) {
    currentIndex = index;
    emit(HomeChangeBottomSheetState());
  }

  ProductModel? productModel;

  List<DataModel>? seedModel;
  List<DataModel>? plantModel;
  List<DataModel>? toolModel;

  int? productModelLength;

  void getProductsData() async {



    String atoken = CacheHelper.getData(key: 'atoken');

    // print(atoken);
    emit(LoadingProductsDataState());
    await DioHelper.getDate(url: GET_PRODUCTS, token: atoken, data: {})
        .then((value) {

      productModel = ProductModel.fromJson(value.data);

      plantModel = [];
      seedModel = [];
      toolModel = [];

      productModelLength = productModel!.data!.length;

      emit(SuccessProductsDataState());

      for (int i = 0; i < productModelLength! ; i++) {

        if (productModel!.data![i].type == 'PLANT') {
          plantModel!.add(productModel!.data![i]);
        }

        if (productModel!.data![i].type == 'SEED') {
          seedModel!.add(productModel!.data![i]);
        }

        if (productModel!.data![i].type == 'TOOL') {
          toolModel!.add(productModel!.data![i]);
        }
      }



      // print(productModel!.data![1].name);
      // print('$BaseURL${productModel!.data![5].imageUrl}');
    }).catchError((error) {
      print(error.toString());
      emit(ErrorProductsDataState(error.toString()));
    });
  }
}
