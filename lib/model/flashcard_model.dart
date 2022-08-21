// To parse this JSON data, do
//
//     final flashResponse = flashResponseFromJson(jsonString);

import 'dart:convert';

FlashResponse flashResponseFromJson(String str) =>
    FlashResponse.fromJson(json.decode(str));

String flashResponseToJson(FlashResponse data) => json.encode(data.toJson());

class FlashResponse {
  FlashResponse({
    required this.message,
    required this.data,
    required this.success,
  });

  final dynamic message;
  final Map<String, Datum> data;
  final bool success;

  factory FlashResponse.fromJson(Map<String, dynamic> json) => FlashResponse(
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
    required this.createdAt,
    required this.definition,
    required this.question,
  });

  final int createdAt;
  final String definition;
  final String question;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        createdAt: json["created_at"],
        definition: json["definition"],
        question: json["question"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt,
        "definition": definition,
        "question": question,
      };
}
