import 'package:confio/screens/auth_screens/loginscreenUI.dart';
import 'package:confio/screens/auth_screens/signupscreenUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui' as ui;

class AuthOptionScreenUI extends StatefulWidget {
  const AuthOptionScreenUI({super.key});

  @override
  State<AuthOptionScreenUI> createState() => _AuthOptionScreenUIState();
}

class _AuthOptionScreenUIState extends State<AuthOptionScreenUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.bottomCenter,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "lib/assets/images/onboardingillustration.png",
                ),
                fit: BoxFit.cover)),
        child: Padding(
          padding: EdgeInsets.only(left: 21.w, right: 19.w, bottom: 25.h),
          child: Container(
            width: 388.w,
            height: 328.h,
            decoration: BoxDecoration(
                color: const Color(0xff303030),
                borderRadius: BorderRadius.circular(11.r),
                border: Border.all(width: 1.w, color: Color(0xff666666))),
            child: Padding(
              padding: EdgeInsets.only(
                  top: 14.h, left: 32.w, right: 32.w, bottom: 34.h),
              child: Column(
                children: [
                  Container(
                    height: 53.h,
                    width: 76.w,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("lib/assets/images/logo.png"))),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 90.w, right: 90.w),
                    child: Divider(
                      thickness: 1,
                      color: const Color(0xff8B8b8B),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    'Te damos la bienvenida a confio!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontFamily: 'PoppinsSemiBold',
                      fontWeight: FontWeight.w600,
                      height: 1,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  const Text(
                    'Manage your money with self pools, and effortlessly handle shared paymen',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF919191),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                      letterSpacing: 0.21,
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Stack(
                    children: [
                      CustomPaint(
                        size: const Size(207, 20),
                        painter: RPSCustomPainter(),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 10, left: 20),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const SignUpScreenUI();
                              }));
                            },
                            child: Text(
                              'REGISTER',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color(0xFF6079E0),
                                fontSize: 14.sp,
                                fontFamily: 'PoppinsBold',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(top: 10, left: 135),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const LoginScreenUI();
                              }));
                            },
                            child: Text(
                              'SIGN IN',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color(0xFF6079E0),
                                fontSize: 14.sp,
                                fontFamily: 'PoppinsBold',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, 18);
    path_0.cubicTo(0, 8.05888, 8.05887, 0, 18, 0);
    path_0.lineTo(81.0275, 0);
    path_0.cubicTo(85.3374, 0, 89.2935, 1.51475, 92.3925, 4.04091);
    path_0.cubicTo(95.6347, 6.68378, 99.3172, 9.19116, 103.5, 9.19116);
    path_0.lineTo(103.5, 9.19116);
    path_0.cubicTo(107.683, 9.19116, 111.365, 6.68378, 114.608, 4.04092);
    path_0.cubicTo(117.707, 1.51475, 121.663, 0, 125.973, 0);
    path_0.lineTo(189, 0);
    path_0.cubicTo(198.941, 0, 207, 8.05888, 207, 18);
    path_0.cubicTo(207, 27.9411, 198.941, 36, 189, 36);
    path_0.lineTo(125.973, 36);
    path_0.cubicTo(121.662, 36, 117.706, 34.485, 114.607, 31.9584);
    path_0.cubicTo(111.365, 29.3155, 107.683, 26.8082, 103.5, 26.8082);
    path_0.lineTo(103.5, 26.8082);
    path_0.cubicTo(99.3175, 26.8082, 95.6352, 29.3155, 92.3934, 31.9584);
    path_0.cubicTo(89.2943, 34.485, 85.3378, 36, 81.0275, 36);
    path_0.lineTo(18, 36);
    path_0.cubicTo(8.05886, 36, 0, 27.9411, 0, 18);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
