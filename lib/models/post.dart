import 'package:intl/intl.dart';

class Post {
  String? name;
  String? display_name;
  String? header;
  String? description;
  String? profile_pic;
  String? image_url;
  int? likes;
  int? comments;
  int? shared;
  DateTime? published;

  Post(
      this.name,
      this.published,
      this.header,
      this.description,
      this.profile_pic,
      this.display_name,
      this.image_url,
      this.likes,
      this.comments,
      this.shared,
      );

  Post.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    display_name = json['display_name'];
    header = json['header'];
    description = json['description'];
    profile_pic = json['profile_pic'];
    image_url = json['image_url'];
    likes = json['likes'];
    comments = json['comments'];
    shared = json['shared'];

    // Parse the string representation of date to DateTime
    if (json['published'] is String) {
      try {
        final dateFormat = DateFormat('yyyy-MM-dd hh:mm a');
        published = dateFormat.parse(json['published']);
      } catch (e) {
        print('Error parsing date: $e');
        published = null;
      }
    } else if (json['published'] is int) {
      // If 'published' is represented as an epoch timestamp (in seconds)
      published = DateTime.fromMillisecondsSinceEpoch(json['published'] * 1000);
    } else {
      published = null; // Handle other cases accordingly
    }
  }
}
