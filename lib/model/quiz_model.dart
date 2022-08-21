// To parse this JSON data, do
//
//     final quizResponse = quizResponseFromJson(jsonString);

import 'dart:convert';

QuizResponse quizResponseFromJson(String str) =>
    QuizResponse.fromJson(json.decode(str));

String quizResponseToJson(QuizResponse data) => json.encode(data.toJson());

class QuizResponse {
  QuizResponse({
    required this.message,
    required this.data,
    required this.success,
  });

  final dynamic message;
  final Map<String, Datum> data;
  final bool success;

  factory QuizResponse.fromJson(Map<String, dynamic> json) => QuizResponse(
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
    required this.answer,
    required this.opt1,
    required this.opt2,
    required this.opt3,
    required this.opt4,
    required this.question,
  });

  final String answer;
  final String opt1;
  final String opt2;
  final String opt3;
  final String opt4;
  final String question;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        answer: json["answer"],
        opt1: json["opt1"],
        opt2: json["opt2"],
        opt3: json["opt3"],
        opt4: json["opt4"],
        question: json["question"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "opt1": opt1,
        "opt2": opt2,
        "opt3": opt3,
        "opt4": opt4,
        "question": question,
      };
}
