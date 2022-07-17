
import 'package:flutter/material.dart';
import 'package:shiro_bot/constants/app_images.dart';

class RectangleLogo extends StatelessWidget {
  final double size;
  const RectangleLogo({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Image.asset(AppImages.logo),
    );
  }
}
