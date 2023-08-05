import 'package:beamer/beamer.dart';
import 'package:confio/screens/auth_screens/loginscreen.dart';
import 'package:confio/screens/auth_screens/signupscreen.dart';
import 'package:confio/screens/greeting_screens/authoptionscreen.dart';
import 'package:confio/screens/greeting_screens/greetingscreen.dart';
import 'package:confio/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/route_manager.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final routerDelegate = BeamerDelegate(
    locationBuilder: RoutesLocationBuilder(
      routes: {
        '/': (context, state, data) => const GreetingScreen(),
        '/auth-options': (context, state, data) => const AuthOptionScreen(),
        '/login': (context, state, data) => const LoginScreen(),
        '/home': (context, state, data) => const HomeScreen(),
        '/signup': (context, state, data) => const SignUpScreen(),
      }
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: BeamerParser(),
      routerDelegate: routerDelegate,
    );
  }
}