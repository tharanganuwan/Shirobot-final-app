import 'package:flutter/material.dart';

class RatingButton extends StatefulWidget {
  final ValueChanged<int> onRatingChanged;
  const RatingButton({Key? key, required this.onRatingChanged})
      : super(key: key);

  @override
  State<RatingButton> createState() => _RatingButtonState();
}

class _RatingButtonState extends State<RatingButton> {
  int currentStartRate = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          5,
          (index) {
            return GestureDetector(
              onTap: () {
                currentStartRate = index + 1;
                widget.onRatingChanged(currentStartRate);
                setState(() {});
              },
              child: index + 1 <= currentStartRate
                  ? ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (bounds) {
                        return const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFFFDA2D),
                            Color(0xFFFF9A23),
                          ],
                        ).createShader(
                            Rect.fromLTWH(0, 0, bounds.width, bounds.height));
                      },
                      child: const Icon(
                        Icons.star_rounded,
                        size: 44,
                      ),
                    )
                  : const Icon(
                      Icons.star_rounded,
                      size: 44,
                      color: Color(0xFFE0E0E0),
                    ),
            );
          },
        )
      ],
    );
  }
}
