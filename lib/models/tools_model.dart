class ToolModel {
  String? toolId;
  String? name;
  String? description;
  String? imageUrl;

  ToolModel({this.toolId, this.name, this.description, this.imageUrl});

  ToolModel.fromJson(Map<String, dynamic> json) {
    toolId = json['toolId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['toolId'] = this.toolId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}