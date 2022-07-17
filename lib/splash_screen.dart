import 'package:shiro_bot/config/app_route_config.dart';
import 'package:shiro_bot/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shiro_bot/constants/app_images.dart';
import 'package:shiro_bot/screens/Auth/view/auth_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  void navigateToNextPage(BuildContext context) {
    // Check here if the user is logged in or not.
    // If the user is logged in, navigate to the home page.
    // If the user is not logged in, navigate to the login page.

    Future.delayed(
      const Duration(seconds: 2),
      () {
        AppRouteConfig.pushReplacement(
          context,
          //
          // if logged in HomePage() else LoginPage().
          //
          const AuthPage(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //
    navigateToNextPage(context);

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.blueGradient,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200.0,
                width: 200.0,
                padding: const EdgeInsets.all(15.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(AppImages.logo),
              )
            ],
          ),
        ),
      ),
    );
  }
}
