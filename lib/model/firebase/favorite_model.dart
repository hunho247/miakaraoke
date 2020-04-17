class Favorite {
  String videoId;
  String title;
  String description;
  String thumbnail;
  int favCount;

  Favorite({
    this.videoId,
    this.title,
    this.description,
    this.thumbnail,
    this.favCount,
  });

  Favorite.fromJson(Map<String, dynamic> json) {
    videoId = json['videoId'];
    title = json['title'];
    description = json['description'];
    thumbnail = json['thumbnail'];
    favCount = json['favCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['videoId'] = this.videoId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['thumbnail'] = this.thumbnail;
    data['favCount'] = this.favCount;
    return data;
  }
}
