// To parse this JSON data, do
//
//     final articleResponse = articleResponseFromJson(jsonString);

import 'dart:convert';

ArticleResponse articleResponseFromJson(String str) =>
    ArticleResponse.fromJson(json.decode(str));

String articleResponseToJson(ArticleResponse data) =>
    json.encode(data.toJson());

class ArticleResponse {
  ArticleResponse({
    required this.message,
    required this.data,
    required this.success,
  });

  final dynamic message;
  final Map<String, Datum> data;
  final bool success;

  factory ArticleResponse.fromJson(Map<String, dynamic> json) =>
      ArticleResponse(
        message: json["message"],
        data: Map.from(json["data"])
            .map((k, v) => MapEntry<String, Datum>(k, Datum.fromJson(v))),
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": Map.from(data)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "success": success,
      };
}

class Datum {
  Datum({
    required this.category,
    required this.isVideo,
    required this.media,
    required this.text,
    required this.title,
  });

  final String category;
  final bool isVideo;
  final String media;
  final String text;
  final String title;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        category: json["category"],
        isVideo: json["is_video"],
        media: json["media"],
        text: json["text"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "is_video": isVideo,
        "media": media,
        "text": text,
        "title": title,
      };
}
