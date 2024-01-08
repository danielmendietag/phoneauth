class MyUser {
  String? email;
  String? password;
  String? phone;
  String? displayName;
  String? golfCourse;
  String? city;
  String? state;
  String? country;
  String? uid;
  String? profilePic;
  bool? host;
  bool? hostType;
  double? handicap;

  MyUser({
    this.email,
    this.password,
    this.phone,
    this.displayName,
    this.golfCourse,
    this.city,
    this.state,
    this.country,
    this.uid,
    this.profilePic,
    this.host,
    this.hostType,
    this.handicap,
  });

  MyUser.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    displayName = json['display_name']; // Updated field name
    golfCourse = json['golf_course']; // Updated field name
    city = json['city'];
    state = json['state'];
    country = json['country'];
    uid = json['uid'];
    profilePic = json['profile_pic']; // Updated field name
    host = json['host'];
    hostType = json['host_type']; // Updated field name
    handicap = json['handicap']?.toDouble(); // Ensure it's a double or null
  }
}