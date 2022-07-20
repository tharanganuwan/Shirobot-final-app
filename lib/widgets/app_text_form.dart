import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shiro_bot/constants/app_colors.dart';

class AppTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String hintText;
  final TextStyle? hintStyle;
  final bool isPassword;
  final FontWeight? fontWeight;
  final TextInputType? keyboardType;
  final bool? isDense;
  final String icon;
  final List<TextInputFormatter>? inputFormatters;

  final String? validator;

  const AppTextFormField({
    Key? key,
    required this.hintText,
    required this.icon,
    this.hintStyle,
    this.isPassword = false,
    this.fontWeight,
    this.keyboardType,
    this.isDense,
    this.controller,
    this.onChanged,
    this.inputFormatters,
    this.validator,
  }) : super(key: key);

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.lightWhite,
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Container(
            height: 30,
            width: 30,
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: AppColors.greenGradient),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              widget.icon,
              // color: Colors.black,
            ),
          ),
          Expanded(
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return widget.validator;
                } else {
                  return null;
                }
              },
              controller: widget.controller,
              onChanged: widget.onChanged,
              cursorWidth: 1,
              cursorColor: Colors.black,
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 16,
                fontWeight: widget.fontWeight,
              ),
              obscureText: widget.isPassword ? !isPasswordVisible : false,
              obscuringCharacter: "•",
              keyboardType: widget.keyboardType,
              inputFormatters: widget.inputFormatters,
              decoration: InputDecoration(
                isDense: widget.isDense,
                contentPadding: const EdgeInsets.all(10),
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: widget.hintStyle ??
                    GoogleFonts.montserrat(
                      color: const Color(0xFFC4C4C4),
                      fontSize: 12,
                      fontWeight: widget.fontWeight,
                    ),
              ),
            ),
          ),
          if (widget.isPassword) const SizedBox(width: 10),
          if (widget.isPassword)
            Material(
              borderRadius: BorderRadius.circular(25),
              child: InkWell(
                borderRadius: BorderRadius.circular(25),
                onTap: () {
                  isPasswordVisible = !isPasswordVisible;
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(
                    !isPasswordVisible
                        ? CupertinoIcons.eye_slash
                        : CupertinoIcons.eye,
                    color: Colors.blue,
                    size: 18,
                  ),
                ),
              ),
            ),
          if (widget.isPassword) const SizedBox(width: 10)
        ],
      ),
    );
  }
}
