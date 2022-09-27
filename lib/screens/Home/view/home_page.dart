import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shiro_bot/config/app_route_config.dart';
import 'package:shiro_bot/constants/string_constant.dart';
import 'package:shiro_bot/screens/Auth/providers/user_provider.dart';
import 'package:shiro_bot/screens/Home/controller/home_controller.dart';
import 'package:shiro_bot/screens/Home/controller/session_controller.dart';
import 'package:shiro_bot/screens/Home/view/subpages/liquid_flask_page.dart';
import 'package:shiro_bot/widgets/app_dialogs.dart';
import 'package:shiro_bot/widgets/app_logo.dart';
import 'package:shiro_bot/widgets/app_text.dart';
import 'package:shiro_bot/widgets/gradient_blue_button.dart';
import 'package:shiro_bot/widgets/logout_button.dart';
import 'package:shiro_bot/widgets/temperature_range_button.dart';
import 'package:shiro_bot/widgets/toggle_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(seconds: 1), () async {
        AppDialogs.showBluetoothPermision(context);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SessionController _controller = context.watch<SessionController>();

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Stack(
                    children: const [
                      /// App Logo
                      AppLogo(
                        height: 150,
                        width: 150,
                      ),

                      Align(
                        alignment: Alignment.topRight,
                        child: LogoutButton(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  Consumer<userProvider>(
                    builder: (context, value, child) {
                      return AppText(
                        textAlign: TextAlign.center,
                        text: "Welcome ", //${model.firstName}",
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                      );
                    },
                  ),

                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: AppText(
                      text:
                          "Please select the options below to\nstart the session",
                      color: Color(0xFFA1A4B2),
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 30),

                  ///
                  ///
                  ///
                  /// Duration
                  ///
                  ///
                  ///
                  ToggleButton(
                    value: _controller.duration,
                    title: "Duration",
                    leftValue: "30 Mins",
                    rightValue: "60 Mins",
                    onChanged: (value) async {
                      /////////////////////////////////////////////////////////
                      ///
                      Provider.of<HomeController>(context, listen: false)
                          .setDuration(value);

                      _controller.duration = value;

                      ////////////////////////////////////////////////////////////
                      _controller.duration = value;
                    },
                  ),

                  ///
                  ///
                  ///
                  /// Type
                  ///
                  ///
                  ///
                  const SizedBox(height: 20),
                  ToggleButton(
                    value: _controller.temperatureType,
                    title: "Type",
                    leftValue: "Cold",
                    rightValue: "Hot",
                    onChanged: (value) {
                      Provider.of<HomeController>(context, listen: false)
                          .sethotCool(value);

                      _controller.temperatureType = value;
                    },
                  ),

                  ///
                  ///
                  ///
                  /// Temperature Range
                  ///
                  ///
                  ///
                  const SizedBox(height: 20),
                  TemperatureRangeButton(
                    title: "Temperature Range(°C)",
                    enabled: _controller.temperatureType != StringConstant.cold,
                  ),

                  ///
                  ///
                  ///
                  /// Oscillation Mechanism
                  ///
                  ///
                  ///
                  const SizedBox(height: 20),
                  ToggleButton(
                    value: _controller.oscillationMachanism,
                    title: "Oscillation Mechanism",
                    leftValue: "No",
                    rightValue: "Yes",
                    onChanged: (value) {
                      _controller.oscillationMachanism = value;
                    },
                  ),
                  const SizedBox(height: 40),

                  ///
                  ///
                  ///
                  /// Next Button
                  ///
                  ///
                  ///
                  const Spacer(),
                  BlueGradientButton(
                    text: "NEXT",
                    onTap: () {
                      if (Provider.of<HomeController>(context, listen: false)
                          .isblutoothOn) {
                        AppRouteConfig.push(context, const LiquidFlaskScreen());
                      } else {
                        AppDialogs.showBluetoothPermision(context);
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
