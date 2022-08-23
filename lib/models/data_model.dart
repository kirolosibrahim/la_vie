import 'package:la_vie/models/plant_model.dart';
import 'package:la_vie/models/seeds_model.dart';
import 'package:la_vie/models/tools_model.dart';

class DataModel {
  String? productId;
  String? name;
  String? description;
  String? imageUrl;
  String? type;
  int? price;
  bool? available;
  SeedModel? seed;
  PlantModel? plant;
  ToolModel? tool;

  DataModel(
      {this.productId,
        this.name,
        this.description,
        this.imageUrl,
        this.type,
        this.price,
        this.available,
        this.seed,
        this.plant,
        this.tool});

  DataModel.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    type = json['type'];
    price = json['price'];
    available = json['available'];
    seed = json['seed'] != null ? new SeedModel.fromJson(json['seed']) : null;
    plant = json['plant'] != null ? new PlantModel.fromJson(json['plant']) : null;
    tool = json['tool'] != null ? new ToolModel.fromJson(json['tool']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['imageUrl'] = this.imageUrl;
    data['type'] = this.type;
    data['price'] = this.price;
    data['available'] = this.available;
    if (this.seed != null) {
      data['seed'] = this.seed!.toJson();
    }
    if (this.plant != null) {
      data['plant'] = this.plant!.toJson();
    }
    if (this.tool != null) {
      data['tool'] = this.tool!.toJson();
    }
    return data;
  }
}