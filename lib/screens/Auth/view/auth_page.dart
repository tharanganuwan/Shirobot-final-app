import 'package:provider/provider.dart';
import 'package:shiro_bot/config/app_route_config.dart';
import 'package:shiro_bot/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shiro_bot/constants/app_images.dart';
import 'package:shiro_bot/screens/Auth/view/Login/login_page.dart';
import 'package:shiro_bot/screens/Auth/view/SIgnup/signup_page.dart';
import 'package:shiro_bot/screens/Home/controller/home_controller.dart';
import 'package:shiro_bot/widgets/gradient_blue_button.dart';
import 'package:shiro_bot/widgets/gradient_green_button.dart';
import 'package:shiro_bot/widgets/rectangle_logo.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.background3),
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.blueGradient,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(),

              ///
              ///
              ///
              /// Logo
              ///
              ///
              ///
              const Center(child: RectangleLogo(size: 200.0)),

              ///
              ///
              ///
              /// Login & Signup Buttons
              ///
              ///
              ///
              const Spacer(),
              Container(
                height: 200,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(34)),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BlueGradientButton(
                        text: "LOGIN",
                        onTap: () async {
                          Provider.of<HomeController>(context, listen: false)
                              .chechBlutoothOn(context);
                          AppRouteConfig.push(context, const LoginPage());
                        },
                      ),
                      const SizedBox(height: 15),
                      GreenGradientButton(
                        text: "CREATE ACCOUNT",
                        onTap: () async {
                          Provider.of<HomeController>(context, listen: false)
                              .chechBlutoothOn(context);
                          AppRouteConfig.push(context, const SignUpPage());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
