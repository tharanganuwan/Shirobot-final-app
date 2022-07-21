import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:shiro_bot/components/custom_dialogBox.dart';
import 'package:shiro_bot/config/app_route_config.dart';
import 'package:shiro_bot/constants/app_colors.dart';
import 'package:shiro_bot/constants/app_images.dart';
import 'package:shiro_bot/screens/Auth/controller/auth_controller.dart';
import 'package:shiro_bot/screens/Auth/model/auth_model.dart';
import 'package:shiro_bot/screens/Auth/providers/registration_provider.dart';
import 'package:shiro_bot/screens/Auth/view/Login/login_page.dart';
import 'package:shiro_bot/screens/Auth/view/SIgnup/subpages/signup_second_page.dart';
import 'package:shiro_bot/utils/util_function.dart';
import 'package:shiro_bot/widgets/app_text.dart';
import 'package:shiro_bot/widgets/app_text_form.dart';
import 'package:shiro_bot/widgets/arrow_back_button.dart';
import 'package:shiro_bot/widgets/gradient_blue_button.dart';
import 'package:shiro_bot/widgets/gradient_text.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  static final _authModel = AuthModel();

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  void onNextPressed(BuildContext context) {
    AppRouteConfig.push(
        context, SignUpSecondPage(authModel: SignUpPage._authModel));
  }

  bool submit = false;
  final myController = TextEditingController();
//----------
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myController.addListener(() {
      setState(() {
        submit = myController.text.isNotEmpty;
      });
    });
  }

  bool _isAcceptTermsAndConditions = false;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

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
                      Image.asset(
                        AppImages.logo,
                        height: 80,
                        width: 80,
                      ),
                      const SizedBox(height: 20),
                      Container(
                          width: double.maxFinite,
                          padding: const EdgeInsets.all(20.0),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: AppColors.boxShadow,
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(34)),
                          ),
                          child: Consumer<RegistrationProvider>(
                            builder: (context, value, child) {
                              return Form(
                                key: _formkey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      height: 6,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: AppColors.lightWhite,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    const AppText(
                                      text: "Create an Account",
                                      fontSize: 26,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    const SizedBox(height: 10),
                                    const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 0, 20, 0),
                                      child: AppText(
                                        text:
                                            "Welcome! We're so glad you're here. Fill out the info below to get started.",
                                        color: AppColors.lightGrey,
                                        fontSize: 12,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    AppTextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Please enter first name";
                                        } else {
                                          return null;
                                        }
                                      },
                                      hintText: "First Name",
                                      controller: value.firstnameController,
                                      onChanged: (value) {
                                        SignUpPage._authModel.firstName =
                                            value.trim();
                                        setState(() {
                                          _isAcceptTermsAndConditions = false;
                                        });
                                      },
                                      icon: AppImages.avatar,
                                    ),
                                    const SizedBox(height: 20),
                                    AppTextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Please enter last name";
                                        } else {
                                          return null;
                                        }
                                      },
                                      hintText: "Last Name",
                                      controller: value.lastnameController,
                                      onChanged: (value) {
                                        SignUpPage._authModel.lastName =
                                            value.trim();
                                      },
                                      icon: AppImages.avatar,
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
                                      hintText: "Email",
                                      controller: value.emailController,
                                      onChanged: (value) {
                                        SignUpPage._authModel.email =
                                            value.trim();
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                      icon: AppImages.email,
                                    ),
                                    const SizedBox(height: 20),
                                    AppTextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty ||
                                            value.length < 8) {
                                          return "Must be 8 or more characters";
                                        } else {
                                          return null;
                                        }
                                      },
                                      hintText: "Password",
                                      controller: value.passwordController,
                                      onChanged: (value) {
                                        SignUpPage._authModel.password =
                                            value.trim();
                                      },
                                      icon: AppImages.lock,
                                      isPassword: true,
                                    ),
                                    const SizedBox(height: 20),
                                    AppTextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty ||
                                            value.length < 8) {
                                          return "Must be 8 or more characters";
                                        } else {
                                          return null;
                                        }
                                      },
                                      hintText: "Confirm Password",
                                      controller:
                                          value.confirmpasswordController,
                                      onChanged: (value) {
                                        SignUpPage._authModel.confirmPassword =
                                            value.trim();
                                      },
                                      icon: AppImages.lock,
                                      isPassword: true,
                                    ),
                                    const SizedBox(height: 20),
                                    BlueGradientButton(
                                        text: "NEXT",
                                        onTap: () {
                                          if (_formkey.currentState!
                                                  .validate() &&
                                              value.confirmpasswordController
                                                      .text ==
                                                  value.passwordController
                                                      .text) {
                                            onNextPressed(context);
                                          } else {
                                            print('error');
                                          }
                                        }),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const AppText(
                                          text: "Already Have Account?",
                                          color: AppColors.lightGrey,
                                          fontSize: 12,
                                        ),
                                        const SizedBox(width: 10),
                                        GestureDetector(
                                          onTap: () {
                                            AppRouteConfig.push(
                                                context, const LoginPage());
                                          },
                                          child: const GradientText(
                                            text: "Login Now",
                                            fontSize: 12,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          )),
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
}
