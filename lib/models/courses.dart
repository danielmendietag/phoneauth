class Course {
  int? numberHoles;
  int? postalCode;
  String? golfClubName;
  String? address;
  String? city;
  String? state;
  String? country;
  String? imageUrl;

  Course(
    this.numberHoles,
    this.postalCode,
    this.golfClubName,
    this.address,
    this.city,
    this.state,
    this.country,
    this.imageUrl,
  );

  Course.fromJson(Map<String, dynamic> json) {
    numberHoles = json['numberHoles'];
    postalCode = json['postalCode'];
    golfClubName = json['golfClubName'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    imageUrl = json['imageUrl'];
  }
}
