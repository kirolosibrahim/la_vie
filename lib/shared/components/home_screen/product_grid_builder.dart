import 'package:flutter/material.dart';
import 'package:la_vie/shared/components/home_screen/product_item_grid_builder.dart';

import '../../../models/data_model.dart';

class ProductGridBuilder extends StatelessWidget {

  List<DataModel>? model ;
  BuildContext? context;

  ProductGridBuilder(this.model, this.context);

  @override
  Widget build( context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 1 / 1.1,
      mainAxisSpacing: 5,
      crossAxisSpacing: 10,
      physics: const BouncingScrollPhysics(),
      children:List.generate(
        model!.length, (index) => ProductGridProductItemBuilder(model ,index, context),
      ),
    );
  }
}
