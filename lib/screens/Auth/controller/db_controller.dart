import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:logger/logger.dart';
import 'package:shiro_bot/screens/Auth/model/auth_model.dart';

class DatabaseController {
//Firestore instance create
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  //create a collection reffernce
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  //save user information
  Future<void> saveUserData(
    String name,
    String phone,
    String email,
    String uid,
  ) {
    //Call the user's CollectionReference to add a new user
    // return users
    //     .add({
    //       'name': name, // John Doe
    //       'email': email, // Stokes and Sons
    //       'phone': phone,

    //       // 42
    //     })
    //     .then((value) => print("User Added"))
    //     .catchError((error) => print("Failed to add user: $error"));

    return users
        .doc(uid)
        .set({
          'name': name, // John Doe
          'email': email, // Stokes and Sons
          'phone': phone,
          'uid': uid,
          'address': null,
          'cartItems': []
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  //get user data
  Future<AuthModel?> getuserData(String id) async {
    try {
      DocumentSnapshot snapshot = await users.doc(id).get();
      Logger().i(snapshot.data());
      AuthModel userModel =
          AuthModel.fromJson(snapshot.data() as Map<String, dynamic>);
      Logger().d(userModel.email);

      return userModel;
    } catch (e) {
      Logger().e(e);
    }
  }
}
