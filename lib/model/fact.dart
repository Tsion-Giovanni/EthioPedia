class Fact {
  Fact({
    this.createdAt,
    this.fact,
    this.image,
  });

  int createdAt;
  String fact;
  String image;

  factory Fact.fromJson(Map<String, dynamic> json) => Fact(
        createdAt: json["created_at"],
        fact: json["fact"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt,
        "fact": fact,
        "image": image,
      };
}