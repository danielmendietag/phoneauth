class Post {
  final String name;
  final DateTime published;
  final String header;
  final String description;
  final String photoUrl;

  Post(
    this.name,
    this.published,
    this.header,
    this.description,
    this.photoUrl,
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'published': published,
    'header': header,
    'description': description,
    'photoUrl': photoUrl,
  };
}
