import 'package:flutter/material.dart';
<<<<<<< ui
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

class ConfioApp extends StatelessWidget {
  const ConfioApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
        designSize: const Size(428, 1050),
        builder: (context, child) {
          return LayoutBuilder(
						builder: (context, constraints) {
							SizeConfig.init(constraints, Orientation.portrait);
							return FutureBuilder<String>(
								future: Routes.getInitialRoute(),
								builder: (context, initRouteSnapshot) {
									return GetMaterialApp(
                    debugShowCheckedModeBanner: false,
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
  }
}
