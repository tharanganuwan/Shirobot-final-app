import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:logger/logger.dart';
import 'package:shiro_bot/screens/Auth/model/auth_model.dart';
import 'package:shiro_bot/screens/Auth/model/user_model.dart';

class DatabaseController {
//Firestore instance create
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  //create a collection reffernce
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  //save user information
  Future<void> saveUserData(
    String firstName,
    String lastName,
    // String dob,
    // String gender,
    String email,
    String uid,
    // String phoneNumber,
    // String password,
    // String confirmPassword,
    // String country,
    // String countryCode,
  ) {
    //Call the user's CollectionReference to add a new user

    return users
        .doc(uid)
        .set({
          'firstName': firstName, // John Doe
          'lastName': lastName, // Stokes and Sons
          'email': email,
          'uid': uid,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  // get user data
  Future<UserModel?> getuserData(String id) async {
    try {
      DocumentSnapshot snapshot = await users.doc(id).get();
      Logger().i(snapshot.data());

      UserModel userModel =
          UserModel.fromMap(snapshot.data() as Map<String, dynamic>);
      // AuthModel userModel =
      //     AuthModel.fromJson(snapshot.data() as Map<String, dynamic>);
      Logger().d(userModel.email);

      return userModel;
    } catch (e) {
      Logger().e(e);
    }
  }
}
