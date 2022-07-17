import 'package:flutter/material.dart';
import 'package:shiro_bot/constants/app_colors.dart';

class AppCheckBox extends StatefulWidget {
  final bool? value;
  final ValueChanged<bool> onChanged;
  const AppCheckBox({Key? key, required this.onChanged, this.value})
      : super(key: key);

  @override
  State<AppCheckBox> createState() => _AppCheckBoxState();
}

class _AppCheckBoxState extends State<AppCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        isChecked = !isChecked;
        widget.onChanged(isChecked);
        setState(() {});
      },
      child: Container(
        height: 18,
        width: 18,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          gradient: const LinearGradient(colors: AppColors.greenGradient),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 100),
              switchInCurve: Curves.easeInOutBack,
              child: widget.value ?? isChecked
                  ? const Icon(
                      Icons.check,
                      key: ValueKey("2"),
                      color: Colors.white,
                      size: 16,
                    )
                  : Container(
                      key: const ValueKey("1"),
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
