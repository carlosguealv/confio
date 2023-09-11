import 'package:confio/screens/auth/forgot_password_screen.dart';
import 'package:confio/screens/auth/login_screen.dart';
import 'package:confio/screens/auth/signup_screen.dart';
import 'package:confio/screens/greeting_screens/auth_option_screen.dart';
import 'package:confio/screens/greeting_screens/greeting_screen.dart';
import 'package:confio/screens/home_screen/home_screen.dart';
import 'package:confio/screens/home_screen/navbar.dart';
import 'package:confio/services/authentication_service.dart';
import 'package:get/get.dart';

class Routes {
  static List<GetPage> getPages() {
    return [
      GetPage(
        name: '/',
        page: () => const GreetingScreen(),
      ),
      GetPage(
        name: '/auth-options',
        page: () => const AuthOptionScreen(),
      ),
      GetPage(
        name: '/login',
        page: () => const LoginScreen(),
      ),
      GetPage(
        name: '/home',
        page: () => const NavBar(),
      ),
      GetPage(
        name: '/signup',
        page: () => const SignupScreen(),
      ),
      GetPage(
        name: '/forgot',
        page: () => const ForgotPasswordScreen(),
      ),
    ];
  }

  static Future<String> getInitialRoute() async {
    if (authenticationService.isUserLoggedIn()) {
      return '/home';
    }
    return '/';
  }
}