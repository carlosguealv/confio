import 'package:confio/models/confio_user.dart';
import 'package:confio/models/overall_payment.dart';
import 'package:confio/screens/home_screen/widget/tuscobros.dart';
import 'package:confio/services/authentication_service.dart';
import 'package:confio/services/firebase_service.dart';
import 'package:confio/services/storage_service.dart';
import 'package:confio/utils/size_config.dart';
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
              height: sx! * 0.2,
              width: sy! * 0.2,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/logo.png"),
                      fit: BoxFit.scaleDown)),
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
                            image: AssetImage("assets/images/notification.png"),
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
                            image: AssetImage("assets/images/Setting.png"),
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
                      FutureBuilder(
                          future: firebaseService.getUserByUid(otherId),
                          builder: (context, snapshot) {
                            if (snapshot.data == null) {
                              return Container(
                                height: 36,
                                width: 36,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    image: const DecorationImage(
                                        image: AssetImage(
                                          "assets/images/blankuser.png",
                                        ),
                                        fit: BoxFit.scaleDown)),
                              );
                            }
                            return FutureBuilder(
                                future: storageService.getProfilePic(
                                    ConfioUser.fromDocument(snapshot.data!)),
                                builder: (context, snapshot1) {
                                  return Container(
                                    height: 36,
                                    width: 36,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        image: DecorationImage(
                                            image: snapshot1.hasData
                                                ? MemoryImage(snapshot1.data!)
                                                    as ImageProvider
                                                : const AssetImage(
                                                    "assets/images/blankuser.png",
                                                  ),
                                            fit: BoxFit.scaleDown)),
                                  );
                                });
                          }),
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
                ],
              ),
              SizedBox(
                height: 42.h,
              ),
              Container(
                width: 388,
                height: 47.44,
                decoration: BoxDecoration(
                  color: const Color(0xff0A0A0A),
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        width: 27.97,
                        height: 27.97,
                        decoration: ShapeDecoration(
                          image: const DecorationImage(
                            image: AssetImage("assets/images/dollar.png"),
                          ),
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
                              text: 'Este pago es de ',
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
                            TextSpan(
                              text:
                                  '${widget.overallPayment.currency} ${widget.overallPayment.amount * widget.overallPayment.due.length}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 1.50,
                                letterSpacing: 0.24,
                              ),
                            ),
                            TextSpan(
                              text: ' en total',
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
                    itemCount: widget.overallPayment.due.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: TusCobrosWidget(payment: widget.overallPayment.due[index], amount: widget.overallPayment.amount, currency: widget.overallPayment.currency,),
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
