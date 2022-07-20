import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shiro_bot/screens/Home/controller/home_controller.dart';
import 'package:shiro_bot/screens/Home/view/home_page.dart';
import 'package:shiro_bot/splash_screen.dart';
import 'package:shiro_bot/screens/Home/controller/session_controller.dart';

void main() {
  runApp(const ShiroBot());
}

class ShiroBot extends StatelessWidget {
  const ShiroBot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SessionController()),
        ChangeNotifierProvider(create: (context) => HomeController()),
      ],
      child: MaterialApp(
        title: 'Shirobot',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.green),
        home: const SplashScreen(),
        //: HomePage(),
      ),
    );
  }
}
