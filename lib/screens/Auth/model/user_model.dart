class UserModel {
  late String uid;
  late String firstName;
  late String lastName;
  late String email;

  UserModel({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  UserModel.fromMap(Map map) {
    uid = map['uid'];
    firstName = map['firstName'];
    lastName = map['lastName'];
    email = map['email'];
  }
}
