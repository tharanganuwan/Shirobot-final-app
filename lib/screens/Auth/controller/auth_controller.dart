import 'package:flutter/widgets.dart';
import 'package:shiro_bot/config/app_route_config.dart';
import 'package:shiro_bot/screens/Auth/model/auth_model.dart';
import 'package:shiro_bot/screens/Auth/view/Login/login_page.dart';
import 'package:shiro_bot/utils/app_utils.dart';


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
}
