import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shiro_bot/config/app_route_config.dart';
import 'package:shiro_bot/constants/app_colors.dart';
import 'package:shiro_bot/constants/app_images.dart';
import 'package:shiro_bot/screens/Home/controller/home_controller.dart';
import 'package:shiro_bot/screens/Home/controller/liquid_flask_controller.dart';
import 'package:shiro_bot/screens/Home/controller/session_controller.dart';
import 'package:shiro_bot/widgets/app_dialogs.dart';
import 'package:shiro_bot/widgets/liquid_drop.dart';
import 'package:shiro_bot/screens/Home/view/subpages/session_page.dart';
import 'package:shiro_bot/widgets/app_text.dart';
import 'package:shiro_bot/widgets/arrow_back_button.dart';
import 'package:shiro_bot/widgets/app_logo.dart';
import 'package:shiro_bot/widgets/gradient_blue_button.dart';

class LiquidFlaskScreen extends StatefulWidget {
  const LiquidFlaskScreen({Key? key}) : super(key: key);

  @override
  State<LiquidFlaskScreen> createState() => _LiquidFlaskScreenState();
}

class _LiquidFlaskScreenState extends State<LiquidFlaskScreen> {
  void setTime(BuildContext context) {
    second =
        Provider.of<HomeController>(context, listen: false).selectHotCold();
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        if (second > 0) {
          second--;
        } else {
          return;
        }
        Navigator.pop(context);
        showInfo(context, 1);
      });
    });
  }

  Timer? timer;
  int second = 0;
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
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    splashRadius: 20,
                    onPressed: () => {}, //AppRouteConfig.back(context),
                    icon: const Icon(
                      Icons.close,
                      color: Colors.black38,
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  padding: const EdgeInsets.all(25.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: AppColors.greenGradient,
                    ),
                    shape: BoxShape.circle,
                  ),
                  //child: SvgPicture.asset(AppImages.info),
                  child: Center(
                    child: Text(
                      "$second",
                      style: TextStyle(fontSize: 30, color: Colors.white),
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
                          setTime(context);
                          if (Provider.of<HomeController>(context,
                                      listen: false)
                                  .hotCool ==
                              "cold") {
                            showInfo(context, 1);
                          } else {
                            showInfo(context, 2);
                          }

                          Future.delayed(
                            const Duration(seconds: 31),
                            () {
                              AppRouteConfig.push(
                                context,
                                const SessionPage(),
                              );
                            },
                          );
                        },
                      )
                    : BlueGradientButton(
                        isFill: false,
                        text: "DISABLED SESSION",
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
