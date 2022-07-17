import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shiro_bot/config/app_route_config.dart';
import 'package:shiro_bot/constants/app_colors.dart';
import 'package:shiro_bot/constants/app_images.dart';
import 'package:shiro_bot/screens/Home/view/home_page.dart';
import 'package:shiro_bot/widgets/app_logo.dart';
import 'package:shiro_bot/widgets/app_text.dart';
import 'package:shiro_bot/widgets/gradient_blue_button.dart';
import 'package:shiro_bot/widgets/gradient_orange_button.dart';
import 'package:shiro_bot/widgets/logout_button.dart';

class LastPage extends StatelessWidget {
  const LastPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        AppRouteConfig.pushAndRemoveUntil(
                            context, const HomePage());
                      },
                      child: Container(
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
                            shape: BoxShape.circle,
                          ),
                          child: ShaderMask(
                              blendMode: BlendMode.srcIn,
                              shaderCallback: (bounds) {
                                return const LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: AppColors.blueGradient)
                                    .createShader(
                                  Rect.fromLTWH(
                                      0, 0, bounds.width, bounds.height),
                                );
                              },
                              child: SvgPicture.asset(AppImages.home)),
                        ),
                      ),
                    ),
                    const Spacer(),
                    const LogoutButton()
                  ],
                ),
                const Spacer(),

                ///
                ///
                ///
                ///
                /// App Logo
                ///
                ///
                ///
                ///
                const AppLogo(),
                const SizedBox(height: 30),

                ///
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: AppText(
                    text: "Hope you have enjoyed\nthe session!",
                    textAlign: TextAlign.center,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),

                ///
                ///
                ///
                ///
                ///  Stat the session again.
                ///
                ///
                ///
                ///
                BlueGradientButton(
                  text: "START AGAIN",
                  onTap: () {
                    AppRouteConfig.pushAndRemoveUntil(
                        context, const HomePage());
                  },
                ),
                const SizedBox(height: 20),

                ///
                ///
                ///
                /// Exit the complete app.
                ///
                ///
                ///
                OrangeGradientButton(
                  text: "EXIT",
                  onTap: () {
                    SystemNavigator.pop();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
