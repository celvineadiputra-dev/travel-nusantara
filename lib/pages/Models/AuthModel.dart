class AuthModel {
  late String firstName, lastName, fullName;

  AuthModel({required this.firstName, required this.lastName, this.fullName = ""});

  AuthModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    fullName = json['fullName'];
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'fullName': firstName + " " + lastName
    };
  }
}
