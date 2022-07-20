import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shiro_bot/screens/Auth/providers/registration_provider.dart';
import 'package:shiro_bot/screens/Home/controller/home_controller.dart';
import 'package:shiro_bot/splash_screen.dart';
import 'package:shiro_bot/screens/Home/controller/session_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        ChangeNotifierProvider(
          create: (context) => RegistrationProvider(),
        )
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
