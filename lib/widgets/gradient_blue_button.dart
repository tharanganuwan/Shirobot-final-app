import 'package:shiro_bot/constants/app_colors.dart';
import 'package:shiro_bot/widgets/app_text.dart';
import 'package:flutter/material.dart';

class BlueGradientButton extends StatefulWidget {
  final String text;
  final VoidCallback? onTap;
  const BlueGradientButton({Key? key, required this.text, this.onTap})
      : super(key: key);

  @override
  State<BlueGradientButton> createState() => _BlueGradientButtonState();
}

class _BlueGradientButtonState extends State<BlueGradientButton> {
  bool isButtonActive = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 1.0],
          colors: AppColors.blueGradient,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ElevatedButton(
        onPressed: widget.onTap,
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(
              Size(MediaQuery.of(context).size.width, 60)),
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              side: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          // padding: MaterialStateProperty.all(paddingLTRB(40, 15, 40, 15)),
        ),
        child: AppText(
          text: widget.text.toUpperCase(),
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }
}
