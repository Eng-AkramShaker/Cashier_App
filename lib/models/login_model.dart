class User {
  String message;
  String homePage;
  String fullName;

  User({required this.message, required this.homePage, required this.fullName});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      message: json['message'],
      homePage: json['home_page'],
      fullName: json['full_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'home_page': homePage,
      'full_name': fullName,
    };
  }
}
