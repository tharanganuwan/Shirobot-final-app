import 'dart:math' show pi;
import 'package:flutter/material.dart';
import 'package:shiro_bot/config/app_route_config.dart';
import 'package:shiro_bot/constants/app_colors.dart';
import 'package:shiro_bot/screens/Auth/view/auth_page.dart';
import 'package:shiro_bot/widgets/app_text.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppRouteConfig.pushAndRemoveUntil(context, const AuthPage());
      },
      child: Column(
        children: [
          Container(
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              height: 20,
              width: 20,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                gradient:
                    const LinearGradient(colors: AppColors.orangeGradient),
                shape: BoxShape.circle,
              ),
              child: Transform.rotate(
                angle: pi,
                child: const Icon(
                  Icons.arrow_right_alt,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5.0),
          const AppText(
            text: "Logout",
            fontWeight: FontWeight.bold,
            fontSize: 10,
          )
        ],
      ),
    );
  }
}
