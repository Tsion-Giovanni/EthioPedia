// To parse this JSON data, do
//
//     final factResponse = factResponseFromJson(jsonString);

import 'dart:convert';

FactResponse factResponseFromJson(String str) =>
    FactResponse.fromJson(json.decode(str));

String factResponseToJson(FactResponse data) => json.encode(data.toJson());

class FactResponse {
  FactResponse({
    required this.message,
    required this.data,
    required this.success,
  });

  final dynamic message;
  final Map<String, Datum> data;
  final bool success;

  factory FactResponse.fromJson(Map<String, dynamic> json) => FactResponse(
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
    required this.fact,
    required this.image,
  });

  final String fact;
  final String image;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        fact: json["fact"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "fact": fact,
        "image": image,
      };
}
