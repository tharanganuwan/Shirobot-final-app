import 'package:flutter/material.dart';
import 'package:shiro_bot/config/app_route_config.dart';
import 'package:shiro_bot/constants/app_colors.dart';

class ArrowBackButton extends StatelessWidget {
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;
  const ArrowBackButton({Key? key, this.onTap, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onTap ?? () => AppRouteConfig.back(context),
          child: ShaderMask(
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
                Icons.arrow_back_ios,
              ),
            ),
          ),
        ),
        color: Colors.transparent,
      ),
    );

    // Container(
    //   height: 40,
    //   width: 40,
    //   margin: margin ?? const EdgeInsets.fromLTRB(20, 20, 0, 0),
    //   padding: const EdgeInsets.only(left: 10),
    //   alignment: Alignment.center,
    //   decoration: BoxDecoration(
    //     color: Colors.grey.shade200,
    //     borderRadius: BorderRadius.circular(10.0),
    //   ),
    //   child: Material(
    //     borderRadius: BorderRadius.circular(14),
    //     child: InkWell(
    //       borderRadius: BorderRadius.circular(14),
    //       onTap: onTap ?? () => AppRouteConfig.back(context),
    //       child: ShaderMask(
    //         blendMode: BlendMode.srcIn,
    //         shaderCallback: (bounds) {
    //           return const LinearGradient(
    //                   begin: Alignment.topCenter,
    //                   end: Alignment.bottomCenter,
    //                   colors: AppColors.blueGradient)
    //               .createShader(
    //             Rect.fromLTWH(0, 0, bounds.width, bounds.height),
    //           );
    //         },
    //         child: const Icon(
    //           Icons.arrow_back_ios,
    //         ),
    //       ),
    //     ),
    //     color: Colors.transparent,
    //   ),
    // );

    // GestureDetector(
    //   onTap: onTap ?? () => AppRouteConfig.back(context),
    //   child: Container(
    //     height: 40,
    //     width: 40,
    //     margin: margin ?? const EdgeInsets.fromLTRB(20, 20, 0, 0),
    //     padding: const EdgeInsets.only(left: 10),
    //     alignment: Alignment.center,
    //     decoration: BoxDecoration(
    //       color: Colors.grey.shade200,
    //       borderRadius: BorderRadius.circular(10.0),
    //     ),
    //     child: ShaderMask(
    //       blendMode: BlendMode.srcIn,
    //       shaderCallback: (bounds) {
    //         return const LinearGradient(
    //                 begin: Alignment.topCenter,
    //                 end: Alignment.bottomCenter,
    //                 colors: AppColors.blueGradient)
    //             .createShader(
    //           Rect.fromLTWH(0, 0, bounds.width, bounds.height),
    //         );
    //       },
    //       child: const Icon(
    //         Icons.arrow_back_ios,
    //       ),
    //     ),
    //   ),
    // );
  }
}
