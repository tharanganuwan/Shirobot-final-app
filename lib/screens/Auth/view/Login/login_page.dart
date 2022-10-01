import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shiro_bot/components/custom_dialogBox.dart';
import 'package:shiro_bot/config/app_route_config.dart';
import 'package:shiro_bot/constants/app_colors.dart';
import 'package:shiro_bot/constants/app_images.dart';
import 'package:shiro_bot/screens/Auth/controller/auth_controller.dart';
import 'package:shiro_bot/screens/Auth/providers/registration_provider.dart';
import 'package:shiro_bot/screens/Auth/view/ResetPassword/reset_password.dart';
import 'package:shiro_bot/screens/Auth/view/SIgnup/signup_page.dart';
import 'package:shiro_bot/screens/Home/view/home_page.dart';
import 'package:shiro_bot/utils/util_function.dart';
import 'package:shiro_bot/widgets/app_text.dart';
import 'package:shiro_bot/widgets/app_text_form.dart';
import 'package:shiro_bot/widgets/arrow_back_button.dart';
import 'package:shiro_bot/widgets/checkbox.dart';
import 'package:shiro_bot/widgets/gradient_blue_button.dart';
import 'package:shiro_bot/widgets/gradient_text.dart';
import 'package:shiro_bot/widgets/social_buttons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

//firebase auth instance
FirebaseAuth auth = FirebaseAuth.instance;
var _isObscure = true;

final _email = TextEditingController();
final _password = TextEditingController();
final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              SvgPicture.asset(AppImages.lines),
              const Align(
                alignment: Alignment.topLeft,
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: ArrowBackButton(),
                  ),
                ),
              ),
              SafeArea(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      const SizedBox(height: 50),

                      ///
                      ///
                      ///
                      /// App logo
                      ///
                      ///
                      ///
                      Image.asset(
                        AppImages.logo,
                        height: 160,
                        width: 160,
                      ),
                      const SizedBox(height: 20),

                      ///
                      ///
                      ///
                      /// TextFields to enter login details
                      ///
                      ///
                      ///
                      Container(
                        width: double.maxFinite,
                        padding: const EdgeInsets.all(20.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: AppColors.boxShadow,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(34)),
                        ),
                        child: Form(
                          key: _formkey,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const SizedBox(height: 20),
                              const AppText(
                                text: "Login with Email",
                                fontSize: 26,
                                fontWeight: FontWeight.w700,
                              ),
                              const SizedBox(height: 10),
                              const AppText(
                                text:
                                    "Please fill the following to login into\nyour account",
                                color: AppColors.lightGrey,
                                fontSize: 12,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 20),
                              AppTextFormField(
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                          .hasMatch(value)) {
                                    return "Please enter a valid email address";
                                  } else {
                                    return null;
                                  }
                                },
                                controller: _email,
                                onChanged: (value) {},
                                hintText: "Email",
                                icon: AppImages.email,
                              ),
                              const SizedBox(height: 20),
                              AppTextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "please enter valid password";
                                  }
                                },
                                controller: _password,
                                onChanged: (value) {},
                                hintText: "Password",
                                icon: AppImages.lock,
                                isPassword: true,
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  const SizedBox(width: 5.0),
                                  AppCheckBox(
                                    onChanged: (value) {},
                                  ),
                                  const SizedBox(width: 10),
                                  const GradientText(
                                    text: "Remember me",
                                  )
                                ],
                              ),
                              const SizedBox(height: 20),
                              BlueGradientButton(
                                text: "LOGIN",
                                onTap: () async {
                                  if (_formkey.currentState!.validate()) {
                                    AuthController().loginUser(
                                        context, _email.text, _password.text);
                                  }
                                },
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const AppText(
                                    text: "Forgot Password?",
                                    color: AppColors.lightGrey,
                                    fontSize: 12,
                                  ),
                                  const SizedBox(width: 10),
                                  GestureDetector(
                                    onTap: () {
                                      AppRouteConfig.push(
                                        context,
                                        const ResetPassword(),
                                      );
                                    },
                                    child: const GradientText(
                                      text: "Reset here",
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),

                              ///
                              ///
                              /// Divider with OR
                              ///
                              ///
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Expanded(
                                    child: Divider(
                                      color: AppColors.lightGrey,
                                      thickness: 0.2,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  AppText(
                                    text: "OR",
                                    color: AppColors.lightGrey,
                                    fontSize: 12,
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Divider(
                                      color: AppColors.lightGrey,
                                      thickness: 0.2,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),

                              ///
                              ///
                              ///
                              /// Social logins
                              ///
                              ///
                              ///

                              SocialButton(
                                onGoogleTap: () {
                                  Provider.of<RegistrationProvider>(context,
                                          listen: false)
                                      .googleAuth(context);
                                },
                                onFacebookTap: () {
                                  print("Facebook");
                                  Provider.of<RegistrationProvider>(context,
                                          listen: false)
                                      .faceBookAuth();
                                },
                                onLinkedInTap: () {
                                  print("Linedin");
                                },
                              ),

                              const SizedBox(height: 20),

                              // ElevatedButton(
                              //     onPressed: () {
                              //       print("object");
                              //       Provider.of<RegistrationProvider>(context,
                              //               listen: false)
                              //           .faceBookAuth();
                              //     },
                              //     child: Text("Click")),

                              // const SizedBox(height: 20),

                              ///
                              ///
                              ///
                              /// Signup
                              ///
                              ///
                              ///
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const AppText(
                                    text: "Don't Have Account?",
                                    color: AppColors.lightGrey,
                                    fontSize: 12,
                                  ),
                                  const SizedBox(width: 10),
                                  GestureDetector(
                                    onTap: () {
                                      AppRouteConfig.push(
                                          context, const SignUpPage());
                                    },
                                    child: const GradientText(
                                      text: "Regsiter Now",
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //validate fields
  bool inputValidation() {
    var isValid = false;
    if (_email.text.isEmpty || _password.text.isEmpty) {
      isValid = false;
    } else if (!EmailValidator.validate(_email.text)) {
      isValid = false;
    } else {
      isValid = true;
    }
    return isValid;
  }
}
