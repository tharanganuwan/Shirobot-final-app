
import 'package:flutter/material.dart';
import 'package:shiro_bot/constants/app_images.dart';

class AppLogo extends StatelessWidget {
  final double? height;
  final double? width;
  const AppLogo({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width ?? 145,
        height: height ?? 145,
        padding: const EdgeInsets.all(20.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade100,
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Image.asset(
          AppImages.logo,
          height: 160,
          width: 160,
        ),
      ),
    );
  }
}
