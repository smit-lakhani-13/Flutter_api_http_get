// To parse this JSON data, do
//
//     final sample = sampleFromJson(jsonString);

import 'dart:convert';

List<Sample> sampleFromJson(String str) =>
    List<Sample>.from(json.decode(str).map((x) => Sample.fromJson(x)));

String sampleToJson(List<Sample> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Sample {
  Sample({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  factory Sample.fromJson(Map<String, dynamic> json) => Sample(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}
