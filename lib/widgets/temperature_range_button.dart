import 'package:provider/provider.dart';
import 'package:shiro_bot/constants/app_colors.dart';
import 'package:shiro_bot/constants/string_constant.dart';
import 'package:shiro_bot/screens/Home/controller/session_controller.dart';
import 'package:shiro_bot/widgets/app_text.dart';
import 'package:flutter/material.dart';

class TemperatureRangeButton extends StatelessWidget {
  final String title;
  final bool enabled;
  const TemperatureRangeButton({
    Key? key,
    required this.title,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SessionController _controller = context.watch<SessionController>();

    return Row(
      children: [
        AppText(
          text: title,
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
              const SizedBox(width: 5.0),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: enabled ? null : Colors.grey.shade300,
                  gradient: !enabled
                      ? null
                      : const LinearGradient(colors: AppColors.greenGradient),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(14),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(14),
                    onTap: () {
                      if (_controller.temperatureType != StringConstant.cold) {
                        int _temp = _controller.temperatureRange;
                        if (_temp > 35) {
                          _controller.temperatureRange = _temp - 1;
                        }
                      }
                    },
                    child: const Icon(
                      Icons.remove,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.transparent,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 30,
                child: Center(
                  child: FittedBox(
                    child: AppText(
                      text: "${_controller.temperatureRange}",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: enabled ? null : Colors.grey.shade300,
                  gradient: !enabled
                      ? null
                      : const LinearGradient(colors: AppColors.greenGradient),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(14),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(14),
                    onTap: () {
                      if (_controller.temperatureType != StringConstant.cold) {
                        int temp = _controller.temperatureRange;
                        if (temp < 40) {
                          _controller.temperatureRange = temp + 1;
                        }
                      }
                    },
                    child: const Icon(
                      Icons.add,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.transparent,
                ),
              ),
              const SizedBox(width: 5.0),
            ],
          ),
        ),
      ],
    );
  }
}
