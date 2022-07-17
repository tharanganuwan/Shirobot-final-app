import 'package:flutter/material.dart';
import 'package:shiro_bot/constants/app_colors.dart';
import 'package:shiro_bot/widgets/app_text.dart';

class GradientText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final List<Color>? colors;
  const GradientText({Key? key, required this.text, this.fontSize, this.colors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: colors ?? AppColors.blueGradient,
        ).createShader(
          Rect.fromLTWH(
            0,
            0,
            bounds.width,
            bounds.height,
          ),
        );
      },
      child: AppText(
        text: text,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
