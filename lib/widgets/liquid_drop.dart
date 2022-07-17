import 'package:flutter/material.dart';
import 'package:shiro_bot/constants/app_colors.dart';
import 'dart:math' as math;
import 'package:vector_math/vector_math.dart' as vector;

class LiquidDrop extends StatefulWidget {
  final double percentage;
  const LiquidDrop({Key? key, required this.percentage}) : super(key: key);
  @override
  _LiquidDropState createState() => _LiquidDropState();
}

class _LiquidDropState extends State<LiquidDrop> with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(seconds: 3),
      lowerBound: 0,
      upperBound: 360,
      vsync: this,
    );

    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  static const _kSize = Size(250, 400);
  static const _kContainerSize = Size(130, 200);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _kContainerSize.width,
      height: _kContainerSize.height,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) => Stack(
          children: [
            Center(
              child: CustomPaint(
                size: _kSize,
                painter: RPSCustomPainter(),
              ),
            ),
            Center(
              child: ClipPath(
                clipper: CircleClipper(),
                child: CustomPaint(
                  size: _kSize,
                  painter: WavePainter(
                    percentage: widget.percentage,
                    animationController: animationController,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(size.width * 0.500, size.height * 0.950);
    path.cubicTo(size.width * 0.441, size.height * 0.950, size.width * 0.383,
        size.height * 0.943, size.width * 0.329, size.height * 0.929);
    path.cubicTo(size.width * 0.275, size.height * 0.915, size.width * 0.226,
        size.height * 0.895, size.width * 0.185, size.height * 0.869);
    path.cubicTo(size.width * 0.099, size.height * 0.814, size.width * 0.065,
        size.height * 0.736, size.width * 0.083, size.height * 0.636);
    path.cubicTo(size.width * 0.100, size.height * 0.541, size.width * 0.174,
        size.height * 0.457, size.width * 0.254, size.height * 0.373);
    path.cubicTo(size.width * 0.272, size.height * 0.355, size.width * 0.291,
        size.height * 0.336, size.width * 0.309, size.height * 0.317);
    path.cubicTo(size.width * 0.378, size.height * 0.247, size.width * 0.450,
        size.height * 0.174, size.width * 0.499, size.height * 0.095);
    path.cubicTo(size.width * 0.538, size.height * 0.129, size.width * 0.574,
        size.height * 0.163, size.width * 0.606, size.height * 0.199);
    path.cubicTo(size.width * 0.624, size.height * 0.217, size.width * 0.642,
        size.height * 0.236, size.width * 0.660, size.height * 0.254);
    path.cubicTo(size.width * 0.723, size.height * 0.315, size.width * 0.787,
        size.height * 0.380, size.width * 0.836, size.height * 0.450);
    path.cubicTo(size.width * 0.949, size.height * 0.614, size.width * 0.948,
        size.height * 0.746, size.width * 0.833, size.height * 0.845);
    path.cubicTo(size.width * 0.796, size.height * 0.877, size.width * 0.746,
        size.height * 0.903, size.width * 0.689, size.height * 0.921);
    path.cubicTo(size.width * 0.632, size.height * 0.940, size.width * 0.569,
        size.height * 0.949, size.width * 0.504, size.height * 0.950);
    path.lineTo(size.width * 0.500, size.height * 0.950);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class WavePainter extends CustomPainter {
  AnimationController animationController;
  double percentage;

  WavePainter({required this.animationController, required this.percentage});
  @override
  void paint(Canvas canvas, Size size) {
    double xOffset = size.width;
    List<Offset> polygonOffsets = [];

    for (int i = -xOffset.toInt(); i <= xOffset; i++) {
      polygonOffsets.add(Offset(
          i.toDouble(),
          math.sin(vector.radians(i.toDouble() * 360 / 280) -
                      vector.radians(animationController.value)) *
                  10 +
              size.height * percentage));
    }

    const Gradient gradient = LinearGradient(
      begin: Alignment.centerLeft, //top
      end: Alignment.centerRight, //center
      colors: AppColors.blueGradient,
    );

    final wave = Path();
    wave.addPolygon(polygonOffsets, false);
    wave.lineTo(xOffset, size.height);
    wave.lineTo(-xOffset, size.height);
    wave.close();

    final rect =
        Rect.fromLTWH(0.0, -size.height / 5 - 22, size.width, size.height / 2);
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.fill;
    canvas.drawPath(wave, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path outerdimmPath = Path();
    outerdimmPath.moveTo(size.width * 0.181, size.height * 0.911);
    outerdimmPath.lineTo(size.width * 0.181, size.height * 0.911);
    outerdimmPath.cubicTo(
        size.width * 0.387,
        size.height * 1.018,
        size.width * 0.687,
        size.height * 0.998,
        size.width * 0.861,
        size.height * 0.877);
    outerdimmPath.cubicTo(
        size.width * 0.950,
        size.height * 0.816,
        size.width * 0.977,
        size.height * 0.738,
        size.width * 0.972,
        size.height * 0.660);
    outerdimmPath.cubicTo(
        size.width * 0.967,
        size.height * 0.582,
        size.width * 0.930,
        size.height * 0.503,
        size.width * 0.885,
        size.height * 0.437);
    outerdimmPath.cubicTo(
        size.width * 0.836,
        size.height * 0.366,
        size.width * 0.771,
        size.height * 0.301,
        size.width * 0.705,
        size.height * 0.236);
    outerdimmPath.cubicTo(
        size.width * 0.688,
        size.height * 0.219,
        size.width * 0.671,
        size.height * 0.202,
        size.width * 0.654,
        size.height * 0.184);
    outerdimmPath.cubicTo(
        size.width * 0.609,
        size.height * 0.138,
        size.width * 0.564,
        size.height * 0.090,
        size.width * 0.506,
        size.height * 0.049);
    outerdimmPath.lineTo(size.width * 0.480, size.height * 0.029);
    outerdimmPath.lineTo(size.width * 0.467, size.height * 0.053);
    outerdimmPath.cubicTo(
        size.width * 0.427,
        size.height * 0.130,
        size.width * 0.362,
        size.height * 0.200,
        size.width * 0.293,
        size.height * 0.271);
    outerdimmPath.cubicTo(
        size.width * 0.283,
        size.height * 0.280,
        size.width * 0.274,
        size.height * 0.290,
        size.width * 0.265,
        size.height * 0.299);
    outerdimmPath.cubicTo(
        size.width * 0.204,
        size.height * 0.360,
        size.width * 0.143,
        size.height * 0.421,
        size.width * 0.097,
        size.height * 0.488);
    outerdimmPath.cubicTo(
        size.width * 0.049,
        size.height * 0.554,
        size.width * 0.020,
        size.height * 0.633,
        size.width * 0.027,
        size.height * 0.709);
    outerdimmPath.cubicTo(
        size.width * 0.034,
        size.height * 0.784,
        size.width * 0.079,
        size.height * 0.857,
        size.width * 0.181,
        size.height * 0.911);
    outerdimmPath.close();

    Paint paint1Stroke = Paint();
    paint1Stroke.style = PaintingStyle.stroke;
    paint1Stroke.strokeWidth = size.width * 0.05;
    paint1Stroke.color = const Color(0xff33C7F6).withOpacity(0.2);
    canvas.drawPath(outerdimmPath, paint1Stroke);

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = const Color(0xFF1C75BC);
    canvas.drawPath(outerdimmPath, paint1Fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.500, size.height * 0.950);
    path_2.cubicTo(size.width * 0.441, size.height * 0.950, size.width * 0.383,
        size.height * 0.943, size.width * 0.329, size.height * 0.929);
    path_2.cubicTo(size.width * 0.275, size.height * 0.915, size.width * 0.226,
        size.height * 0.895, size.width * 0.185, size.height * 0.869);
    path_2.cubicTo(size.width * 0.099, size.height * 0.814, size.width * 0.065,
        size.height * 0.736, size.width * 0.083, size.height * 0.636);
    path_2.cubicTo(size.width * 0.100, size.height * 0.541, size.width * 0.174,
        size.height * 0.457, size.width * 0.254, size.height * 0.373);
    path_2.cubicTo(size.width * 0.272, size.height * 0.355, size.width * 0.291,
        size.height * 0.336, size.width * 0.309, size.height * 0.317);
    path_2.cubicTo(size.width * 0.378, size.height * 0.247, size.width * 0.450,
        size.height * 0.174, size.width * 0.499, size.height * 0.095);
    path_2.cubicTo(size.width * 0.538, size.height * 0.129, size.width * 0.574,
        size.height * 0.163, size.width * 0.606, size.height * 0.199);
    path_2.cubicTo(size.width * 0.624, size.height * 0.217, size.width * 0.642,
        size.height * 0.236, size.width * 0.660, size.height * 0.254);
    path_2.cubicTo(size.width * 0.723, size.height * 0.315, size.width * 0.787,
        size.height * 0.380, size.width * 0.836, size.height * 0.450);
    path_2.cubicTo(size.width * 0.949, size.height * 0.614, size.width * 0.948,
        size.height * 0.746, size.width * 0.833, size.height * 0.845);
    path_2.cubicTo(size.width * 0.796, size.height * 0.877, size.width * 0.746,
        size.height * 0.903, size.width * 0.689, size.height * 0.921);
    path_2.cubicTo(size.width * 0.632, size.height * 0.940, size.width * 0.569,
        size.height * 0.949, size.width * 0.504, size.height * 0.950);
    path_2.lineTo(size.width * 0.500, size.height * 0.950);
    path_2.close();

    Paint paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = Colors.white;
    canvas.drawPath(path_2, paint2Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
