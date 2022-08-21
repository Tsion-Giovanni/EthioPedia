class FlashCard {
  FlashCard({
    this.createdAt,
    this.definition,
    this.question,
  });

  int createdAt;
  String definition;
  String question;

  factory FlashCard.fromJson(Map<String, dynamic> json) => FlashCard(
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