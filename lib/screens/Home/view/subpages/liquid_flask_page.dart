import 'package:flutter/material.dart';
import 'package:shiro_bot/config/app_route_config.dart';
import 'package:shiro_bot/widgets/app_dialogs.dart';
import 'package:shiro_bot/widgets/liquid_drop.dart';
import 'package:shiro_bot/screens/Home/view/subpages/session_page.dart';
import 'package:shiro_bot/widgets/app_text.dart';
import 'package:shiro_bot/widgets/arrow_back_button.dart';
import 'package:shiro_bot/widgets/app_logo.dart';
import 'package:shiro_bot/widgets/gradient_blue_button.dart';

class LiquidFlaskScreen extends StatelessWidget {
  const LiquidFlaskScreen({Key? key}) : super(key: key);

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
                const SizedBox(height: 10),
                Stack(
                  children: const [
                    ///
                    ///
                    ///
                    /// App Logo
                    ///
                    ///
                    ///
                    ///
                    AppLogo(
                      height: 150,
                      width: 150,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: ArrowBackButton(
                        margin: EdgeInsets.zero,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                const FittedBox(
                  child: AppText(
                    text: "Please fill the liquid",
                    fontSize: 23,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),

                ///
                ///
                ///
                /// Middle liquid image
                ///
                ///
                ///
                GestureDetector(
                  onTap: () {
                    AppDialogs.showAlert(context);
                  },
                  child: const LiquidDrop(percentage: 0.4),
                ),
                const Spacer(),

                ///
                ///
                ///
                /// Next Button
                ///
                ///
                ///
                BlueGradientButton(
                  text: "START SESSION",
                  onTap: () {
                    ///
                    ///
                    ///  For testing now i have added furure.delayed function to navigate after 3 seconds.
                    ///  You can impliment as your requirement.
                    ///
                    ///
                    ///
                    AppDialogs.showInfo(context);
                    Future.delayed(
                      const Duration(seconds: 1),
                      () {
                        AppRouteConfig.back(context); // close the dialog
                        AppRouteConfig.push(
                          context,
                          const SessionPage(),
                        );
                      },
                    );
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
