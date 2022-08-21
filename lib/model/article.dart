class Article {
  String title;
  String category;
  String text;
  String media;
  Bool is_video;
  Article({
    this.title,
    this.category,
    this.text,
    this.media,
    this.is_video,
  });

  Article.fromJson(Map<String, dynamic> json) {
       category: json["category"],
        createdAt: json["created_at"],
        isVideo: json["is_video"],
        media: json["media"],
        text: json["text"],
        title: json["title"],
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
        "category": category,
        "created_at": createdAt,
        "is_video": isVideo,
        "media": media,
        "text": text,
        "title": title,
    };
 return data;
}