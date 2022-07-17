import 'package:flutter/material.dart';
import 'package:shiro_bot/constants/app_colors.dart';
import 'package:shiro_bot/widgets/app_text.dart';

class ToggleButton extends StatefulWidget {
  final String title;
  final String leftValue;
  final String rightValue;
  final String? value;
  final ValueChanged<String> onChanged;
  const ToggleButton({
    Key? key,
    required this.leftValue,
    required this.rightValue,
    required this.onChanged,
    required this.title,
    this.value,
  }) : super(key: key);

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  void onLeftValueTap() {
    widget.onChanged(widget.leftValue);
  }

  void onRightValueTap() {
    widget.onChanged(widget.rightValue);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppText(
          text: widget.title,
          fontWeight: FontWeight.w600,
        ),
        const Spacer(),
        Container(
          height: 50,
          width: 140,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade100,
                blurRadius: 5.0,
                spreadRadius: 2.0,
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                height: 50,
                width: 70,
                decoration: widget.leftValue != widget.value
                    ? null
                    : BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: const LinearGradient(
                          colors: AppColors.greenGradient,
                        ),
                      ),
                child: Material(
                  borderRadius: BorderRadius.circular(14),
                  child: InkWell(
                    onTap: onLeftValueTap,
                    borderRadius: BorderRadius.circular(14),
                    child: Center(
                      child: AppText(
                        text: widget.leftValue,
                        color: widget.leftValue == widget.value
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  color: Colors.transparent,
                ),
              ),
              Container(
                height: 50,
                width: 70,
                decoration: widget.rightValue != widget.value
                    ? null
                    : BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: const LinearGradient(
                          colors: AppColors.greenGradient,
                        ),
                      ),
                child: Material(
                  borderRadius: BorderRadius.circular(14),
                  child: InkWell(
                    onTap: onRightValueTap,
                    borderRadius: BorderRadius.circular(14),
                    child: Center(
                      child: AppText(
                        text: widget.rightValue,
                        color: widget.rightValue == widget.value
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  color: Colors.transparent,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
