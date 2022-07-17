import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shiro_bot/config/app_route_config.dart';
import 'package:shiro_bot/constants/app_colors.dart';
import 'package:shiro_bot/constants/app_images.dart';
import 'package:shiro_bot/screens/Auth/view/Login/login_page.dart';
import 'package:shiro_bot/screens/LastPage/last_page.dart';
import 'package:shiro_bot/widgets/app_text.dart';
import 'package:shiro_bot/widgets/gradient_blue_button.dart';
import 'package:shiro_bot/widgets/gradient_orange_button.dart';
import 'package:shiro_bot/widgets/rating_button.dart';

class AppDialogs {
  static showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
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
                  onPressed: () => AppRouteConfig.back(context),
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black38,
                  ),
                ),
              ),
              Container(
                height: 100,
                width: 100,
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: AppColors.greenGradient),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.done,
                  size: 80,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: AppText(
                  text:
                      "An email has been sent to you with a link to reset password.",
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40),
            ],
            mainAxisSize: MainAxisSize.min,
          ),
        ),
      ),
    );
  }

  static passwordChangedSuccess(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Container(
                height: 100,
                width: 100,
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: AppColors.greenGradient),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.done,
                  size: 80,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: AppText(
                  text: "Password changed successfully!",
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: BlueGradientButton(
                  text: "LOGIN NOW",
                  onTap: () {
                    AppRouteConfig.pushAndRemoveUntil(
                        context, const LoginPage());
                  },
                ),
              ),
            ],
            mainAxisSize: MainAxisSize.min,
          ),
        ),
      ),
    );
  }

  static Future<String?> showdatepicker(BuildContext context) async {
    DateTime? _resp = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365 * 100)),
      lastDate: DateTime.now().add(const Duration(days: 365 * 100)),
    );

    if (_resp != null) {
      return _resp.toString().split(" ").first;
    } else {
      return null;
    }
  }

  ///
  ///
  ///
  /// show maximum leve reached
  ///
  ///
  ///
  static void showAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Container(
                height: 100,
                width: 100,
                padding: const EdgeInsets.all(25.0),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFFDA2D),
                      Color(0xFFFF7F23),
                    ],
                  ),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(AppImages.alert),
              ),
              const SizedBox(height: 20),

              ///
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: AppText(
                  text: "Maximum Level Reached",
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: BlueGradientButton(
                  text: "OKAY",
                  onTap: () => AppRouteConfig.back(context),
                ),
              ),
            ],
            mainAxisSize: MainAxisSize.min,
          ),
        ),
      ),
    );
  }

  ///
  ///
  /// Session will be start after this time
  ///
  ///
  static void showInfo(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
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
                  onPressed: () => AppRouteConfig.back(context),
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
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: AppColors.greenGradient,
                  ),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(AppImages.info),
              ),
              const SizedBox(height: 20),

              ///
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: FittedBox(
                  child: AppText(
                    text: "Your session will start in 30 Secs",
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
    );
  }

  ///
  ///
  ///
  /// Confirm end the session
  ///
  ///
  ///
  static void showEndSessionWarning(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Container(
                height: 100,
                width: 100,
                padding: const EdgeInsets.all(25.0),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFFDA2D),
                      Color(0xFFFF7F23),
                    ],
                  ),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(AppImages.warning),
              ),
              const SizedBox(height: 20),

              ///
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: AppText(
                  text: "Are you sure, you want to end the session?",
                  color: Colors.blue,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const AppText(
                text: "You cannot undo this action",
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: OrangeGradientButton(
                  text: "END SESSION",
                  onTap: () {
                    AppRouteConfig.back(context); // close the current dialog
                    AppDialogs.showRating(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: BlueGradientButton(
                  text: "CANCEL",
                  onTap: () => AppRouteConfig.back(context),
                ),
              ),
              const SizedBox(height: 20),
            ],
            mainAxisSize: MainAxisSize.min,
          ),
        ),
      ),
    );
  }

  ///
  ///
  /// showSessionCompleted
  ///
  ///
  ///
  static showSessionCompleted(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Container(
                height: 100,
                width: 100,
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: AppColors.greenGradient),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.done,
                  size: 80,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: AppText(
                  text: "Your Session is complete!",
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: BlueGradientButton(
                  text: "OKAY",
                  onTap: () {
                    AppRouteConfig.back(context);
                    AppDialogs.showRating(context);
                  },
                ),
              ),
            ],
            mainAxisSize: MainAxisSize.min,
          ),
        ),
      ),
    );
  }

  static showRating(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: AppText(
                  text: "How was your experience?",
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w600,
                ),
              ),
              RatingButton(
                onRatingChanged: (value) {
                  // print(value);
                },
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: BlueGradientButton(
                  text: "SUBMIT",
                  onTap: () {
                    AppRouteConfig.back(context); // close the current dialog
                    AppDialogs.showFeedback(context); // show the next dialog
                  },
                ),
              )
            ],
            mainAxisSize: MainAxisSize.min,
          ),
        ),
      ),
    );
  }

  static showFeedback(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                const SizedBox(height: 40),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: AppText(
                    text: "Feedback",
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.lightWhite,
                  ),
                  child: TextFormField(
                    cursorWidth: 1,
                    cursorColor: Colors.black,
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    minLines: 5,
                    maxLines: 7,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.all(10),
                      border: InputBorder.none,
                      hintText:
                          "Suggest us what went wrong and we'll work on it.",
                      hintStyle: GoogleFonts.montserrat(
                        color: const Color(0xFFC4C4C4),
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: OrangeGradientButton(
                          text: "CANCEL",
                          onTap: () {
                            AppRouteConfig.pushAndRemoveUntil(
                                context, const LastPage());
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: BlueGradientButton(
                          text: "SUBMIT",
                          onTap: () {
                            AppRouteConfig.back(
                                context); // close the current dialog
                            AppRouteConfig.pushAndRemoveUntil(
                                context, const LastPage());
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
              mainAxisSize: MainAxisSize.min,
            ),
          ),
        ),
      ),
    );
  }

  static void showBluetoothPermision(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) {
                  return const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: AppColors.blueGradient)
                      .createShader(
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(
                    Icons.bluetooth,
                    size: 80,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              ///
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: AppText(
                  text: "Please enable bluetooth to use this app.",
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w600,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: BlueGradientButton(
                  text: "OKAY",
                  onTap: () {
                    AppRouteConfig.back(context);
                  },
                ),
              ),
            ],
            mainAxisSize: MainAxisSize.min,
          ),
        ),
      ),
    );
  }
}
