import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shiro_bot/config/app_route_config.dart';
import 'package:shiro_bot/constants/app_colors.dart';
import 'package:shiro_bot/constants/app_images.dart';
import 'package:shiro_bot/screens/Auth/model/auth_model.dart';
import 'package:shiro_bot/screens/Auth/view/Login/login_page.dart';
import 'package:shiro_bot/widgets/app_text.dart';
import 'package:shiro_bot/widgets/app_text_form.dart';
import 'package:shiro_bot/widgets/arrow_back_button.dart';
import 'package:shiro_bot/widgets/checkbox.dart';
import 'package:shiro_bot/widgets/date_of_birth_select.dart';
import 'package:shiro_bot/widgets/gradient_blue_button.dart';
import 'package:shiro_bot/widgets/gradient_text.dart';
import 'package:shiro_bot/widgets/toggle_button.dart';

class SignUpSecondPage extends StatefulWidget {
  final AuthModel authModel;
  const SignUpSecondPage({Key? key, required this.authModel}) : super(key: key);

  @override
  State<SignUpSecondPage> createState() => _SignUpSecondPageState();
}

class _SignUpSecondPageState extends State<SignUpSecondPage> {
  bool isInstructionSent = false;
  late AuthModel _authModel;

  @override
  void initState() {
    super.initState();
    _authModel = widget.authModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            SvgPicture.asset(AppImages.lines),
            const Align(
              alignment: Alignment.topLeft,
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: ArrowBackButton(),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 50),
                child: Image.asset(
                  AppImages.logo,
                  height: 199,
                  width: 199,
                ),
              ),
            ),
            Align(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
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
                          const SizedBox(height: 5.0),
                          Container(
                            height: 6,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: AppColors.lightWhite,
                            ),
                          ),
                          const SizedBox(height: 30),
                          ToggleButton(
                            value: _authModel.gender,
                            title: "Gender",
                            leftValue: "Male",
                            rightValue: "Female",
                            onChanged: (value) {
                              _authModel.gender = value;
                              setState(() {});
                            },
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              const AppText(
                                text: "Date of Birth",
                                fontWeight: FontWeight.w600,
                              ),
                              const Spacer(),
                              DateOfBirthSelect(
                                onDateOfBirthChanged: (value) {
                                  _authModel.dob = value;
                                },
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          AppTextFormField(
                            onChanged: (value) {
                              _authModel.country = value.trim();
                            },
                            hintText: "Country",
                            icon: AppImages.earth,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              // Coutry code
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColors.lightWhite,
                                ),
                                child: CountryCodePicker(
                                  onChanged: (value) {
                                    if (value.code != null) {
                                      _authModel.countryCode =
                                          value.code!.trim();
                                    }
                                  },
                                  showCountryOnly: false,
                                  flagWidth: 20,
                                  hideSearch: true,
                                  initialSelection: 'IN',
                                  textStyle: GoogleFonts.montserrat(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  showOnlyCountryWhenClosed: false,
                                  alignLeft: false,
                                ),
                              ),

                              const SizedBox(width: 10),
                              Expanded(
                                child: AppTextFormField(
                                  onChanged: (value) {
                                    _authModel.phoneNumber = value.trim();
                                  },
                                  hintText: "Phone Number",
                                  keyboardType: TextInputType.phone,
                                  icon: AppImages.call,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              const SizedBox(width: 5.0),
                              AppCheckBox(onChanged: (value) {
                                _authModel.isTermsAccepted = value;
                              }),
                              const SizedBox(width: 10),
                              const AppText(text: "I accept the "),
                              const GradientText(text: "Terms & Conditions")
                            ],
                          ),
                          const SizedBox(height: 30),
                          BlueGradientButton(
                            text: "Register",
                            onTap: () {
                              AppRouteConfig.push(context, const LoginPage());
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
