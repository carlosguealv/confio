import 'package:confio/screens/auth/forgot_password_screen.dart';
import 'package:confio/screens/auth/login_screen.dart';
import 'package:confio/screens/auth/signup_screen.dart';
import 'package:confio/screens/greeting_screens/auth_option_screen.dart';
import 'package:confio/screens/payment_screens/paymentscreen.dart';
import 'package:confio/screens/profile_screen/profile_screen.dart';
import 'package:confio/services/authentication_service.dart';
import 'package:get/get.dart';
import 'package:confio/screens/home_screen/home_screen.dart';

class Routes {
  static List<GetPage> getPages() {
    return [
      GetPage(
        name: '/',
        page: () => const ProfileScreen(),
      ),
      // profile screen
      GetPage(
        name: '/profile',
        page: () => const ProfileScreen(),
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
        page: () => const HomeScreen(),
      ),
      GetPage(
        name: '/signup',
        page: () => const SignupScreen(),
      ),
      GetPage(
        name: '/forgot',
        page: () => const ForgotPasswordScreen(),
      ),
      GetPage(
        name: '/payment',
        page: () => const PaymentScreen(),
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
