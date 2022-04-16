class SliderModel {
  int? id;
  String? title;
  String? subtitle;
  String? imageUrl;

  SliderModel({this.id, this.title, this.subtitle, this.imageUrl});

  SliderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subtitle = json['subtitle'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['image_url'] = imageUrl;
    return data;
  }
}
