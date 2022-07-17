import 'package:flutter/material.dart';
import 'package:shiro_bot/constants/app_colors.dart';
import 'package:shiro_bot/widgets/app_dialogs.dart';
import 'package:shiro_bot/widgets/app_logo.dart';
import 'package:shiro_bot/widgets/app_text.dart';
import 'package:shiro_bot/widgets/gradient_text.dart';

class SessionPage extends StatefulWidget {
  const SessionPage({Key? key}) : super(key: key);

  @override
  State<SessionPage> createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage>
    with SingleTickerProviderStateMixin {
  /// Circular animation for the progress bar.
  late AnimationController _animationController;
  late Animation<double> _animation;

  final _stopwatch = Stopwatch();

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: getTotalSeconds),
    );

    _animation = Tween<double>(begin: 0.0, end: 60.0).animate(
      _animationController,
    );

    _animationController.addListener(() {
      if (mounted) setState(() {}); // for the update ui
    });

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _stopwatch.stop();
        _stopwatch.reset();

        /// Show session finished dialog.
        AppDialogs.showSessionCompleted(context);
      }
    });
  }

  /// The percentage of the animation that has elapsed.
  int get getPercentage => ((_animation.value / 60) * 100).toInt();

  // The total number of seconds in the animation.
  // if temparature is hot, it will be 900 seconds(15 minutes), else it will be 30 seconds.
  // Used enum Temperature.hot or Temperature.cold.
  // double get minutesInSeconds => widget.type == TemperatureType.hot ? 15.0 : 0.5;
  double get minutesInSeconds => 0.5;
  int get getTotalSeconds => (minutesInSeconds * 60).toInt();

  int currentSecond = 0;
  String get getRemainingSeconds {
    currentSecond = getTotalSeconds - _stopwatch.elapsed.inSeconds;
    final minutes = (currentSecond / 60).floor();
    final seconds = (currentSecond % 60).floor();

    // return the remaining seconds in the format of mm:ss
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _animationController.dispose();
    _stopwatch.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(height: 30),

                    ///
                    ///
                    ///
                    /// App Logo
                    ///
                    ///
                    ///
                    ///
                    const AppLogo(),

                    ///
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: AppText(
                        text: "Session is in progress",
                        textAlign: TextAlign.center,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),

                    ///
                    ///
                    ///
                    ///
                    ///
                    /// Circle progress bar
                    ///
                    ///
                    ///
                    ///
                    ///
                    AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return Container(
                          height: 180,
                          width: 180,
                          decoration: const BoxDecoration(
                            color: Color(0xFFEFEFEF),
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(5.0),
                          child: Stack(
                            children: [
                              ShaderMask(
                                blendMode: BlendMode.srcIn,
                                shaderCallback: (bounds) {
                                  return const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: AppColors.greenGradient,
                                  ).createShader(
                                    Rect.fromLTWH(
                                      0,
                                      0,
                                      bounds.width,
                                      bounds.height,
                                    ),
                                  );
                                },
                                child: SizedBox(
                                  height: 180,
                                  width: 180,
                                  child: CircularProgressIndicator(
                                    value: _animation.value / 60,
                                    strokeWidth: 10.0,
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  height: 160,
                                  width: 160,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GradientText(
                                      text: "$getPercentage%",
                                      fontSize: 34,
                                    ),
                                    const SizedBox(height: 5.0),
                                    const GradientText(
                                      text: "Completed",
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 20),

                    ///
                    ///
                    ///
                    ///
                    ///
                    ///  Timer
                    ///
                    ///
                    ///
                    ///
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 80,
                          width: 120,
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: Center(
                            child: GradientText(
                              text: getRemainingSeconds.split(":").first,
                              colors: AppColors.greenGradient,
                              fontSize: 50,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const AppText(
                          text: ":",
                          fontSize: 50,
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 10),
                        Container(
                          height: 80,
                          width: 120,
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: Center(
                            child: GradientText(
                              text: getRemainingSeconds.split(":")[1],
                              colors: AppColors.greenGradient,
                              fontSize: 50,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 50),

                    ///
                    ///
                    ///
                    ///
                    /// Session Control Buttons
                    ///
                    ///
                    ///
                    ///
                    ///
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ///
                        ///
                        ///
                        /// Play/Pause button
                        ///
                        ///
                        ///
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: AppColors.blueGradient,
                            ),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: Material(
                            borderRadius: BorderRadius.circular(100),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(100),
                              onTap: () {
                                if (_stopwatch.isRunning) {
                                  _animationController.stop();
                                  _stopwatch.stop();
                                } else {
                                  _animationController.forward();
                                  _stopwatch.start();
                                }
                                setState(() {});
                              },
                              child: Icon(
                                _stopwatch.isRunning
                                    ? Icons.pause_rounded
                                    : Icons.play_arrow_rounded,
                                size: 50,
                                color: Colors.white,
                              ),
                            ),
                            color: Colors.transparent,
                          ),
                        ),

                        ///
                        ///
                        ///
                        ///
                        /// Stop Button
                        ///
                        ///
                        ///
                        ///
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: Material(
                            borderRadius: BorderRadius.circular(100),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(100),
                              onTap: () {
                                AppDialogs.showEndSessionWarning(context);
                              },
                              child: ShaderMask(
                                blendMode: BlendMode.srcIn,
                                shaderCallback: (bounds) {
                                  return const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: AppColors.orangeGradient,
                                  ).createShader(
                                    Rect.fromLTWH(
                                      0,
                                      0,
                                      bounds.width,
                                      bounds.height,
                                    ),
                                  );
                                },
                                child: const Icon(
                                  Icons.stop_rounded,
                                  size: 50,
                                ),
                              ),
                            ),
                            color: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
