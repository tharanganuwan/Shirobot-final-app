import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shiro_bot/components/custom_dialogBox.dart';
import 'package:shiro_bot/config/app_route_config.dart';
import 'package:shiro_bot/screens/Auth/controller/db_controller.dart';
import 'package:shiro_bot/screens/Auth/model/auth_model.dart';
import 'package:shiro_bot/screens/Auth/providers/user_provider.dart';
import 'package:shiro_bot/screens/Auth/view/Login/login_page.dart';
import 'package:shiro_bot/screens/Home/view/home_page.dart';
import 'package:shiro_bot/utils/app_utils.dart';
import 'package:shiro_bot/utils/util_function.dart';

class AuthController {
  // singleton instance of the class for one instance (singleton pattern)
  static final AuthController _instance = AuthController._internal();
  factory AuthController() => _instance;
  AuthController._internal();

  static Future<void> login(BuildContext context, AuthModel authModel) async {
    if (authModel.email.trim().isNotEmpty &&
        authModel.password.trim().isNotEmpty) {
      if (authModel.isTermsAccepted) {
      } else {
        AppUtils.showSnackBar(context, "Accept terms & conditions");
      }
    } else {
      AppUtils.showSnackBar(context, "Login credentials are required!");
    }
  }

  static Future<void> register(
      BuildContext context, AuthModel authModel) async {
    /// Check countruy and phone number are filled or not;
    bool gender = authModel.gender.isNotEmpty;
    bool dob = authModel.dob.isNotEmpty;
    bool country = authModel.country.isNotEmpty;
    bool countryCode = authModel.countryCode.isNotEmpty;
    bool phoneNumber = authModel.phoneNumber.isNotEmpty;

    if (gender && dob && country && phoneNumber) {
      if (countryCode) {
        AppRouteConfig.pushAndRemoveUntil(context, const LoginPage());
      } else {
        AppUtils.showSnackBar(context, "Please select country code!");
      }
    } else {
      AppUtils.showSnackBar(context, "All field are required!");
    }
  }

///////////
///////////
//////////
//////////
  FirebaseAuth auth = FirebaseAuth.instance;

  //User registration function
  Future<void> registerUser(
      BuildContext context,
      String firstname,
      String lastname,
      String email,
      String password,
      String confirmpassword,
      String gender,
      String dateOfBirth,
      String country,
      String phoneNumber) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      savedata(firstname, lastname, email, userCredential);

      if (userCredential.user!.uid.isNotEmpty) {
        await DatabaseController()
            .saveUserData(firstname, lastname, email, userCredential.user!.uid);
      }

      DialogBox()
          .dialogBox(
        context,
        DialogType.SUCCES,
        'User Account Created',
        'Verify Your Email address and Login Now',
      )
          .then((value) {
        Future.delayed(
          const Duration(seconds: 5),
          () {
            UtilFunction.navigateTo(context, HomePage());
          },
        );
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        DialogBox().dialogBox(
          context,
          DialogType.ERROR,
          'The password provided is too weak.',
          'Please enter valid password',
        );
      } else if (e.code == 'email-already-in-use') {
        DialogBox().dialogBox(
          context,
          DialogType.ERROR,
          'The account already exists for that email.',
          'Please enter valid email',
        );
      }
    } catch (e) {
      print(e);
    }
  }

//save data data base
  Future<void> savedata(String? firstname, String? lastname, String? email,
      UserCredential userCredential) async {
    userProvider().userName = firstname!;
    if (userCredential.user!.uid.isNotEmpty) {
      await DatabaseController()
          .saveUserData(firstname, lastname!, email!, userCredential.user!.uid);
    }
  }

  //User registration function
  Future<void> loginUser(
      BuildContext context, String email, String password) async {
    try {
      UserCredential usercredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (usercredential.user != null) {
        UtilFunction.navigateTo(context, HomePage());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        DialogBox().dialogBox(
          context,
          DialogType.ERROR,
          'No user found for that email',
          'Please enter valid email',
        );
      } else if (e.code == 'wrong-password') {
        DialogBox().dialogBox(
          context,
          DialogType.ERROR,
          'wrong password provide for that user.',
          'Please enter valid password',
        );
      }
    }
  }

  //send password reset email function
  Future<void>? sendPasswordResetEmail(
      BuildContext context, String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'Invalid Emai') {
        DialogBox().dialogBox(
          context,
          DialogType.ERROR,
          'Invalid Email',
          'Please enter valid email',
        );
      } else if (e.code == 'wrong-password') {
        DialogBox().dialogBox(
          context,
          DialogType.ERROR,
          'wrong password provide for that user.',
          'Please enter valid password',
        );
      }
    } catch (e) {
      print(e);
    }
  }

//google signin
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
