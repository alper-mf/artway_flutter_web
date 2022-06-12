// To parse this JSON data, do
//
//     final instagramModel = instagramModelFromMap(jsonString);

import 'dart:convert';

import 'package:background_json_parser/background_json_parser.dart';

List<InstagramModel> instagramModelFromMap(String str) =>
    List<InstagramModel>.from(json.decode(str).map((x) => InstagramModel.fromMap(x)));

String instagramModelToMap(List<InstagramModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class InstagramModel extends IBaseModel<InstagramModel> {
  InstagramModel({
    this.id,
    this.author,
    this.width,
    this.height,
    this.url,
    this.downloadUrl,
  });

  String? id;
  String? author;
  int? width;
  int? height;
  String? url;
  String? downloadUrl;

  factory InstagramModel.fromMap(Map<String, dynamic> json) => InstagramModel(
        id: json["id"],
        author: json["author"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        downloadUrl: json["download_url"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "author": author,
        "width": width,
        "height": height,
        "url": url,
        "download_url": downloadUrl,
      };

  @override
  InstagramModel fromJson(Map<String, dynamic> json) => InstagramModel(
        id: json["id"],
        author: json["author"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        downloadUrl: json["download_url"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "author": author,
        "width": width,
        "height": height,
        "url": url,
        "download_url": downloadUrl,
      };
}
