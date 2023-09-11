<<<<<<< HEAD
import 'package:beamer/beamer.dart';
import 'package:confio/screens/auth_screens/forgotpassword.dart';
import 'package:confio/screens/auth_screens/loginscreen.dart';
import 'package:confio/screens/auth_screens/signupscreen.dart';
import 'package:confio/screens/greeting_screens/authoptionscreen.dart';
import 'package:confio/screens/greeting_screens/greetingscreen.dart';
import 'package:confio/screens/home_screen/home_screen.dart';
import 'package:confio/screens/home_screen/navbar.dart';
import 'package:confio/screens/payment_screens/payee_view_depth2.dart';
=======
>>>>>>> 8af2a3b37329d799af894b2c1766c8eeedb2ad67
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';
import 'package:confio/utils/size_config.dart';
import 'package:confio/utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ConfioApp());
}

<<<<<<< HEAD
class MyApp extends StatelessWidget {
  MyApp({super.key});

  final routerDelegate = BeamerDelegate(
    locationBuilder: RoutesLocationBuilder(routes: {
      '/': (context, state, data) => const GreetingScreen(),
      '/auth-options': (context, state, data) => const AuthOptionScreen(),
      '/login': (context, state, data) => const LoginScreen(),
      '/home': (context, state, data) => const HomeScreen(),
      '/signup': (context, state, data) => const SignupScreen(),
      '/forgot': (context, state, data) => const ForgotPasswordScreen(),
    }),
  );
=======
class ConfioApp extends StatelessWidget {
  const ConfioApp({super.key});
>>>>>>> 8af2a3b37329d799af894b2c1766c8eeedb2ad67

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
        designSize: const Size(428, 1081),
        builder: (context, child) {
<<<<<<< HEAD
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routeInformationParser: BeamerParser(),
            routerDelegate: routerDelegate,
          );
        });
=======
          return LayoutBuilder(
						builder: (context, constraints) {
							SizeConfig.init(constraints, Orientation.portrait);
							return FutureBuilder<String>(
								future: Routes.getInitialRoute(),
								builder: (context, initRouteSnapshot) {
									return GetMaterialApp(
										title: 'Confio',
										initialRoute: initRouteSnapshot.data,
										getPages: Routes.getPages(),
									);
								}
							);
						}
					);
        }
		);
>>>>>>> 8af2a3b37329d799af894b2c1766c8eeedb2ad67
  }
}
