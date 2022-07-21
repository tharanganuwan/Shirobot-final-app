import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shiro_bot/config/app_route_config.dart';
import 'package:shiro_bot/constants/app_colors.dart';
import 'package:shiro_bot/constants/app_images.dart';
import 'package:shiro_bot/screens/Home/controller/home_controller.dart';
import 'package:shiro_bot/screens/Home/controller/liquid_flask_controller.dart';
import 'package:shiro_bot/widgets/app_dialogs.dart';
import 'package:shiro_bot/widgets/liquid_drop.dart';
import 'package:shiro_bot/screens/Home/view/subpages/session_page.dart';
import 'package:shiro_bot/widgets/app_text.dart';
import 'package:shiro_bot/widgets/arrow_back_button.dart';
import 'package:shiro_bot/widgets/app_logo.dart';
import 'package:shiro_bot/widgets/gradient_blue_button.dart';
import 'package:slide_countdown/slide_countdown.dart';

class LiquidFlaskScreen extends StatefulWidget {
  const LiquidFlaskScreen({Key? key}) : super(key: key);

  @override
  State<LiquidFlaskScreen> createState() => _LiquidFlaskScreenState();
}

class _LiquidFlaskScreenState extends State<LiquidFlaskScreen> {
  void showInfo(BuildContext context, int n) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                const Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      height: 40,
                    )
                    // IconButton(
                    //   padding: EdgeInsets.zero,
                    //   splashRadius: 20,
                    //   onPressed: () => {}, //AppRouteConfig.back(context),
                    //   icon: const Icon(
                    //     Icons.close,
                    //     color: Colors.black38,
                    //   ),
                    // ),
                    ),
                Container(
                  height: 100,
                  width: 100,
                  //padding: const EdgeInsets.all(25.0),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: AppColors.greenGradient,
                    ),
                    shape: BoxShape.circle,
                  ),
                  //child: SvgPicture.asset(AppImages.info),
                  child: (n == 1)
                      ? const Center(
                          child: SlideCountdown(
                            duration: Duration(seconds: 30),
                          ),
                        )
                      : const Center(
                          child: SlideCountdown(
                            duration: Duration(minutes: 10, seconds: 0),
                          ),
                        ),
                ),
                const SizedBox(height: 20),

                ///
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: FittedBox(
                    child: AppText(
                      text: (n == 1)
                          ? "Your session will start in 30 Secs"
                          : "Your session will start in 10 mins",
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
              mainAxisSize: MainAxisSize.min,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isFilled =
        Provider.of<LiquidFlaskController>(context, listen: false).isLiquidFill;
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
                FittedBox(
                  child: AppText(
                    text: (isFilled)
                        ? "Please press the Start session button and enjoy"
                        : "Please fill the liquid",
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
                (isFilled)
                    ? BlueGradientButton(
                        text: "START SESSION",
                        onTap: () {
                          if (Provider.of<HomeController>(context,
                                      listen: false)
                                  .hotCool ==
                              "cold") {
                            showInfo(context, 1);
                            Future.delayed(
                              const Duration(seconds: 29),
                              () {
                                AppRouteConfig.push(
                                  context,
                                  const SessionPage(),
                                );
                              },
                            );
                          } else {
                            showInfo(context, 2);
                            Future.delayed(
                              const Duration(minutes: 9, seconds: 59),
                              () {
                                AppRouteConfig.push(
                                  context,
                                  const SessionPage(),
                                );
                              },
                            );
                          }
                        },
                      )
                    : BlueGradientButton(
                        isFill: false,
                        text: "START SESSION",
                        onTap: () {},
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
