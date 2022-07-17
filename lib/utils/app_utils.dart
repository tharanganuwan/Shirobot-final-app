import 'package:flutter/material.dart';
import 'package:shiro_bot/constants/app_colors.dart';
import 'package:shiro_bot/widgets/app_text.dart';

class AppUtils {
  static ThemeData themeData = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: AppText(
          text: message,
          color: AppColors.lightWhite,
        ),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
    );
  }
}
