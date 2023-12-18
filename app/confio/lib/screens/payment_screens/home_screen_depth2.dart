import 'package:confio/models/overall_payment.dart';
import 'package:confio/screens/home_screen/widget/tuscobros.dart';
import 'package:confio/services/authentication_service.dart';
import 'package:confio/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

class HomeScreenDepth2 extends StatefulWidget {
  final OverallPayment overallPayment = Get.arguments;

  HomeScreenDepth2({super.key});

  @override
  State<HomeScreenDepth2> createState() => _HomeScreenDepth2State();
}

class _HomeScreenDepth2State extends State<HomeScreenDepth2> {
  String otherId = '';
  @override
  void initState() {
    otherId =
        widget.overallPayment.from == FirebaseAuth.instance.currentUser!.uid
            ? widget.overallPayment.to
            : widget.overallPayment.from;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: false,
        title: Row(
          children: [
            Container(
              height: 22.73,
              width: 22.73,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("lib/assets/images/logo.png"),
                      fit: BoxFit.scaleDown)),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              "Confio",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Cambiar preferencias'),
                          content: const Text(
                              '¿Seguro que quieres cambiar las preferencias de las notificaciones?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cancelar'),
                            ),
                            FutureBuilder(
                                future: (authenticationService.firebaseMessaging
                                    .requestPermission()),
                                builder: (context, snapshot) {
                                  return TextButton(
                                    onPressed: () {
                                      if (snapshot.data!.authorizationStatus !=
                                          AuthorizationStatus.authorized) {
                                        authenticationService
                                            .createAndUploadToken();
                                      }
                                      authenticationService.firebaseMessaging
                                          .deleteToken();
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Cambiar preferencias'),
                                  );
                                }),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 22.h,
                    width: 22.w,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "lib/assets/images/notification.png"),
                            fit: BoxFit.scaleDown)),
                  ),
                ),
                SizedBox(
                  width: 16.h,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 22.h,
                    width: 20.48.w,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("lib/assets/images/Setting.png"),
                            fit: BoxFit.scaleDown)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 36,
                        width: 36,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            image: const DecorationImage(
                                image: NetworkImage(
                                    "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2080&q=80"),
                                fit: BoxFit.scaleDown)),
                      ),
                      SizedBox(
                        width: 19.w,
                      ),
                      FutureBuilder(
                        future: firebaseService
                            .getUserByUid(otherId)
                            .then((value) => value!['email'] as String),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState !=
                              ConnectionState.done) {
                            return Container();
                          }
                          return Text(
                            snapshot.data!,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontFamily: 'InterSemiBold',
                                fontWeight: FontWeight.w600),
                          );
                        },
                      )
                    ],
                  ),
                  Container(
                    width: 36,
                    height: 36,
                    decoration: ShapeDecoration(
                      image: const DecorationImage(
                          image: AssetImage("lib/assets/images/calender.png")),
                      color: const Color(0xAA181819),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1.w,
                          color: const Color(0xff19191A),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 42.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your Earnings',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontFamily: 'InterSemiBold',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.16,
                    ),
                  ),
                  const Text(
                    'Semana',
                    style: TextStyle(
                      color: Color(0xFF7892FF),
                      fontSize: 14,
                      fontFamily: 'InterMedium',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.14,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 38.h,
              ),
              SizedBox(
                width: 389,
                height: 255,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 195,
                      child: Text(
                        '\$0',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.2800000011920929),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.14,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 117,
                      child: Text(
                        '\$1000',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.2800000011920929),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.14,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 156,
                      child: Text(
                        '\$500',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.2800000011920929),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.14,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 78,
                      child: Text(
                        '\$5000',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.2800000011920929),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.14,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 39,
                      child: Text(
                        '\$10000',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.2800000011920929),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.14,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Text(
                        '\$15000',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.2800000011920929),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.14,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 73,
                      top: 117,
                      child: SizedBox(
                        width: 28,
                        height: 122,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 2,
                              top: 112,
                              child: Text(
                                'Jan',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white
                                      .withOpacity(0.6499999761581421),
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.14,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 28,
                                height: 88,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFD999FF),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 129,
                      top: 78,
                      child: SizedBox(
                        width: 28,
                        height: 161,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 1,
                              top: 151,
                              child: Text(
                                'Feb',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white
                                      .withOpacity(0.6499999761581421),
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.14,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 28,
                                height: 127,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFF72E39F),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 245,
                      top: 39,
                      child: SizedBox(
                        width: 28,
                        height: 200,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 2,
                              top: 190,
                              child: Text(
                                'Apr',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white
                                      .withOpacity(0.6499999761581421),
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.14,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 28,
                                height: 166,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFF6DD999),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 187,
                      top: 133,
                      child: SizedBox(
                        width: 28,
                        height: 106,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 1,
                              top: 96,
                              child: Text(
                                'Mar',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white
                                      .withOpacity(0.6499999761581421),
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.14,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 28,
                                height: 72,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFB9F1EE),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 301,
                      top: 133,
                      child: SizedBox(
                        width: 29,
                        height: 106,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 96,
                              child: Text(
                                'May',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white
                                      .withOpacity(0.6499999761581421),
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.14,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 1,
                              top: 0,
                              child: Container(
                                width: 28,
                                height: 72,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFC28AE7),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 44.h,
              ),
              Container(
                width: 388,
                height: 47.44,
                decoration: ShapeDecoration(
                  image: const DecorationImage(
                      image: AssetImage("lib/assets/images/dollar.png"),
                      fit: BoxFit.scaleDown),
                  color: const Color(0xff0A0A0A),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 0.61,
                      color: Colors.white.withOpacity(0.07999999821186066),
                    ),
                    borderRadius: BorderRadius.circular(12.16),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        width: 27.97,
                        height: 27.97,
                        decoration: ShapeDecoration(
                          color: Colors.white.withOpacity(0.05000000074505806),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 0.19,
                              color:
                                  Colors.white.withOpacity(0.10000000149011612),
                            ),
                            borderRadius: BorderRadius.circular(8.32),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 17.w,
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Has recibido ',
                              style: TextStyle(
                                color: Colors.white
                                    .withOpacity(0.44999998807907104),
                                fontSize: 13,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 1.50,
                                letterSpacing: 0.24,
                              ),
                            ),
                            const TextSpan(
                              text: 'S/ 35,000.00 ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 1.50,
                                letterSpacing: 0.24,
                              ),
                            ),
                            TextSpan(
                              text: 'de ',
                              style: TextStyle(
                                color: Colors.white
                                    .withOpacity(0.44999998807907104),
                                fontSize: 13,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 1.50,
                                letterSpacing: 0.24,
                              ),
                            ),
                            const TextSpan(
                              text: 'Payer 1 ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 1.50,
                                letterSpacing: 0.24,
                              ),
                            ),
                            TextSpan(
                              text: 'en ',
                              style: TextStyle(
                                color: Colors.white
                                    .withOpacity(0.44999998807907104),
                                fontSize: 13,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 1.50,
                                letterSpacing: 0.24,
                              ),
                            ),
                            const TextSpan(
                              text: '1 año',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 1.50,
                                letterSpacing: 0.24,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 41.h,
              ),
              Divider(
                height: 1.h,
                color: const Color(0xff1B1B1B),
              ),
              SizedBox(
                height: 41.h,
              ),
              Text(
                'Tus cobros',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.44999998807907104),
                  fontSize: 14,
                  fontFamily: 'RobotoMono',
                  fontWeight: FontWeight.w700,
                  height: 1.90,
                  letterSpacing: 2.90,
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              SizedBox(
                width: 388.w,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: const TusCobrosWidget(),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
