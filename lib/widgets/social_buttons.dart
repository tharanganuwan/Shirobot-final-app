import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shiro_bot/constants/app_images.dart';

class SocialButton extends StatelessWidget {
  final VoidCallback onGoogleTap;
  final VoidCallback onFacebookTap;
  final VoidCallback onLinkedInTap;
  const SocialButton(
      {Key? key,
      required this.onGoogleTap,
      required this.onFacebookTap,
      required this.onLinkedInTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// Google
        ///
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Material(
            borderRadius: BorderRadius.circular(14),
            child: InkWell(
              borderRadius: BorderRadius.circular(14),
              onTap: onGoogleTap,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(AppImages.google),
              ),
            ),
            color: Colors.transparent,
          ),
        ),

        const SizedBox(width: 20),

        /// Facebook button
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Material(
            borderRadius: BorderRadius.circular(14),
            child: InkWell(
              borderRadius: BorderRadius.circular(14),
              onTap: onGoogleTap,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(AppImages.facebook),
              ),
            ),
            color: Colors.transparent,
          ),
        ),

        const SizedBox(width: 20),

        /// Facebook button
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Material(
            borderRadius: BorderRadius.circular(14),
            child: InkWell(
              borderRadius: BorderRadius.circular(14),
              onTap: onGoogleTap,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(AppImages.linkedin),
              ),
            ),
            color: Colors.transparent,
          ),
        ),
      ],
    );
  }
}
