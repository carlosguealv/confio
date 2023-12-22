import 'package:confio/screens/auth/forgot_password_screen.dart';
import 'package:confio/screens/auth/login_screen.dart';
import 'package:confio/screens/auth/signup_screen.dart';
import 'package:confio/screens/greeting_screens/auth_option_screen.dart';
import 'package:confio/screens/payment_screens/home_screen_depth2.dart';
import 'package:confio/screens/payment_screens/payment_screen.dart';
import 'package:confio/screens/profile_screen/profile_screen.dart';
import 'package:confio/screens/settings_screen/account_info_screen.dart';
import 'package:confio/screens/settings_screen/settings_screen.dart';
import 'package:confio/services/authentication_service.dart';
import 'package:get/get.dart';
import 'package:confio/screens/home_screen/home_screen.dart';

class Routes {
  static List<GetPage> getPages() {
    return [
      GetPage(
        name: '/',
        page: () => const AuthOptionScreen(),
      ),
      GetPage(
        name: '/auth-options',
        page: () => const AuthOptionScreen(),
      ),
      // profile screen
      GetPage(
        name: '/profile',
        page: () => const ProfileScreen(),
      ),
      GetPage(
        name: '/home/depth2',
        page: () => HomeScreenDepth2(),
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
      GetPage(
        name: '/settings',
        page: () => const SettingsScreen(),
      ),
      GetPage(
        name: '/account-info',
        page: () => const AccountInfoScreen(),
      ),
    ];
  }

  static Future<String> getInitialRoute() async {
    try {
      bool isLoggedIn = await authenticationService.isUserLoggedIn();
      return isLoggedIn ? '/home' : '/';
    } catch (e) {
      return '/'; // Fallback route in case of error
    }
  }
}
