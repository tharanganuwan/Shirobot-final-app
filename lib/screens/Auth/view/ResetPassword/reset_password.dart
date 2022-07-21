import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shiro_bot/components/custom_dialogBox.dart';
import 'package:shiro_bot/constants/app_colors.dart';
import 'package:shiro_bot/constants/app_images.dart';
import 'package:shiro_bot/screens/Auth/controller/auth_controller.dart';
import 'package:shiro_bot/widgets/app_dialogs.dart';
import 'package:shiro_bot/widgets/app_text.dart';
import 'package:shiro_bot/widgets/app_text_form.dart';
import 'package:shiro_bot/widgets/arrow_back_button.dart';
import 'package:shiro_bot/widgets/gradient_blue_button.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool isInstructionSent = false;
  final _email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            SvgPicture.asset(AppImages.lines),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: SafeArea(
                      child: ArrowBackButton(),
                    ),
                  ),
                  const Spacer(),
                  Image.asset(
                    AppImages.logo,
                    height: 250,
                    width: 250,
                  ),
                  const Spacer(),
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.all(20.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: AppColors.boxShadow,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(34)),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(height: 20),
                        const AppText(
                          text: "Reset Password",
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: AppText(
                            text: isInstructionSent
                                ? "Your new password must be different\nfrom previous used passwords"
                                : "Enter the email associate with your\naccount and we'll send an email with\ninstruction to reset your password",
                            color: AppColors.lightGrey,
                            fontSize: 12,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 20),

                        ///
                        ///
                        ///
                        ///
                        /// Show email address field if instruction is not sent
                        ///
                        ///
                        ///
                        ///
                        if (!isInstructionSent)
                          AppTextFormField(
                            controller: _email,
                            hintText: "Email",
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) {},
                            icon: AppImages.email,
                          ),

                        ///
                        ///
                        ///
                        ///
                        ///
                        /// Show password field if instruction is sent to email.
                        ///
                        ///
                        ///
                        ///
                        if (isInstructionSent)
                          Column(
                            children: [
                              AppTextFormField(
                                passwordvalidator: 'please enter password',
                                hintText: "Type password here",
                                icon: AppImages.lock,
                                isPassword: true,
                                onChanged: (value) {},
                              ),
                              const SizedBox(height: 20),
                              AppTextFormField(
                                passwordvalidator: 'please enter password',
                                hintText: "Confirm  password here",
                                icon: AppImages.lock,
                                isPassword: true,
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        const SizedBox(height: 50),

                        ///
                        ///
                        /// Show 'Send Instructions' Button if instruction is not sent.
                        ///
                        ///
                        if (!isInstructionSent)
                          BlueGradientButton(
                            text: "Send Instructions",
                            onTap: () async {
                              AppDialogs.showSuccessDialog(context);
                              isInstructionSent = true;
                              if (inputValidation()) {
                                await AuthController().sendPasswordResetEmail(
                                    context, _email.text);
                              } else {
                                DialogBox().dialogBox(
                                  context,
                                  DialogType.ERROR,
                                  'Incorrect Email',
                                  'Please enter correct email',
                                );
                              }
                            },
                          ),

                        ///
                        ///
                        /// Show Submit Button if instruction is sent.
                        ///
                        ///
                        if (isInstructionSent)
                          BlueGradientButton(
                            text: "Submit",
                            onTap: () {
                              AppDialogs.passwordChangedSuccess(context);
                            },
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool inputValidation() {
    var isValid = false;
    if (_email.text.isEmpty) {
      isValid = false;
    } else if (!EmailValidator.validate(_email.text)) {
      isValid = false;
    } else {
      isValid = true;
    }
    return isValid;
  }
}
