class Quiz {
  Quiz({
    this.answer,
    this.createdAt,
    this.opt1,
    this.opt2,
    this.opt3,
    this.opt4,
    this.question,
  });

  String answer;
  int createdAt;
  String opt1;
  String opt2;
  String opt3;
  String opt4;
  String question;

  factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
        answer: json["answer"],
        createdAt: json["created_at"],
        opt1: json["opt1"],
        opt2: json["opt2"],
        opt3: json["opt3"],
        opt4: json["opt4"],
        question: json["question"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "created_at": createdAt,
        "opt1": opt1,
        "opt2": opt2,
        "opt3": opt3,
        "opt4": opt4,
        "question": question,
      };
}