class SeedModel {
  String? seedId;
  String? name;
  String? description;
  String? imageUrl;

  SeedModel({this.seedId, this.name, this.description, this.imageUrl});

  SeedModel.fromJson(Map<String, dynamic> json) {
    seedId = json['seedId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seedId'] = this.seedId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}