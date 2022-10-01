import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:shiro_bot/screens/Auth/controller/db_controller.dart';
import 'package:shiro_bot/screens/Auth/model/user_model.dart';
import 'package:shiro_bot/screens/Auth/view/auth_page.dart';
import 'package:shiro_bot/screens/Home/controller/home_controller.dart';
import 'package:shiro_bot/screens/Home/view/home_page.dart';
import 'package:shiro_bot/utils/util_function.dart';

class userProvider extends ChangeNotifier {
  final DatabaseController _databaseController = DatabaseController();
  late UserModel _userModel;
  UserModel get userModel => _userModel;
  var _userName = "User!";
  void setUserName(String name) {
    _userName = name;
    notifyListeners();
  }

  String get cuserName => _userName;

  clearModel() {
    _userModel.email = '';
    _userModel.firstName = '';
    _userModel.lastName = '';
    _userModel.uid = '';
  }

  //initialize user function
  Future<void> initializerUser(BuildContext context) async {
    Provider.of<HomeController>(context, listen: false)
        .chechBlutoothOn(context);
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        Logger().w('User is currently signed out');
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => AuthPage()),
            (route) => false);
        //UtilFunction.navigateTo(context, AuthPage());
      } else {
        Logger().w('User is signed in');
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
            (route) => false);
        //UtilFunction.navigateTo(context, HomePage());

        // await fetchSingleUser(user.uid);
        // userName = _userModel.firstName;
        await getUserDate(user.uid);
      }
    });
  }

  Future<void> getUserDate(String id) async {
    await fetchSingleUser(id);
    _userName = _userModel.firstName;
    notifyListeners();
  }

  Future<void> fetchSingleUser(String id) async {
    _userModel = (await _databaseController.getuserData(id))!;
    print("=======================");
    _userName = _userModel.firstName;
    print(_userModel.firstName);
    print("=======================================");
    print(cuserName);
    print("=======================");
    notifyListeners();
  }
}
