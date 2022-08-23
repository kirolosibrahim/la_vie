import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../../../models/data_model.dart';
import '../../../styles/colors.dart';
import '../../network/remote/end_points.dart';
import '../components.dart';

class ProductGridProductItemBuilder extends StatelessWidget {
  List<DataModel>? model;

  int? index;

  BuildContext? context;

  ProductGridProductItemBuilder(this.model, this.index, this.context);

  @override
  Widget build(context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: SizedBox(
        width: 200,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  ConditionalBuilder(
                    condition: model![index!].imageUrl != null,
                    builder: (BuildContext context) {
                      return SizedBox(
                          height: 80,
                          width: 51,
                          child: Image(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                '$BaseURL${model![index!].imageUrl}'),
                          ));
                    },
                    fallback: (BuildContext context) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Text  MINUS
                        IconButton(
                          onPressed: () {
                            // CounterCubit.get(context).minus();
                          },
                          icon: const Icon(
                            Icons.indeterminate_check_box,
                            color: Colors.grey,
                          ),
                        ),
                        //Text Number
                        const Text(
                          '${1}',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w900),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add_box_rounded,
                              color: Colors.grey,
                            ))
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${model![index!].name}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${model![index!].price}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              defaultButton(
                  function: () {},
                  text: 'Add To Cart',
                  radius: 10,
                  background: primaryColor),
            ],
          ),
        ),
      ),
    );
  }
}
