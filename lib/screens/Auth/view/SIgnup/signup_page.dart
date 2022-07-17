import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shiro_bot/config/app_route_config.dart';
import 'package:shiro_bot/constants/app_colors.dart';
import 'package:shiro_bot/constants/app_images.dart';
import 'package:shiro_bot/screens/Auth/model/auth_model.dart';
import 'package:shiro_bot/screens/Auth/view/Login/login_page.dart';
import 'package:shiro_bot/screens/Auth/view/SIgnup/subpages/signup_second_page.dart';
import 'package:shiro_bot/widgets/app_text.dart';
import 'package:shiro_bot/widgets/app_text_form.dart';
import 'package:shiro_bot/widgets/arrow_back_button.dart';
import 'package:shiro_bot/widgets/gradient_blue_button.dart';
import 'package:shiro_bot/widgets/gradient_text.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  static final _authModel = AuthModel();

  void onNextPressed(BuildContext context) {
    AppRouteConfig.push(context, SignUpSecondPage(authModel: _authModel));
  }

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
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 6,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
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
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                              hintText: "First Name",
                              onChanged: (value) {
                                _authModel.firstName = value.trim();
                              },
                              icon: AppImages.avatar,
                            ),
                            const SizedBox(height: 20),
                            AppTextFormField(
                              hintText: "Last Name",
                              onChanged: (value) {
                                _authModel.lastName = value.trim();
                              },
                              icon: AppImages.avatar,
                            ),
                            const SizedBox(height: 20),
                            AppTextFormField(
                              hintText: "Email",
                              onChanged: (value) {
                                _authModel.email = value.trim();
                              },
                              keyboardType: TextInputType.emailAddress,
                              icon: AppImages.email,
                            ),
                            const SizedBox(height: 20),
                            AppTextFormField(
                              hintText: "Password",
                              onChanged: (value) {
                                _authModel.password = value.trim();
                              },
                              icon: AppImages.lock,
                              isPassword: true,
                            ),
                            const SizedBox(height: 20),
                            AppTextFormField(
                              hintText: "Confirm Password",
                              onChanged: (value) {
                                _authModel.confirmPassword = value.trim();
                              },
                              icon: AppImages.lock,
                              isPassword: true,
                            ),
                            const SizedBox(height: 20),
                            BlueGradientButton(
                              text: "NEXT",
                              onTap: () => onNextPressed(context),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
}
