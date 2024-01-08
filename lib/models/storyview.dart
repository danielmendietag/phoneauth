class Storyview {
  String? displayName;
  String? imageUrl;
  int? likes;

  Storyview(
    this.displayName,
    this.imageUrl,
    this.likes,
  );

  Storyview.fromJson(Map<String, dynamic> json) {
    displayName = json['displayName'];
    imageUrl = json['imageUrl'];
    likes = json['likes'];
  }
}
