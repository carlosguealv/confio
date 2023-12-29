import 'package:confio/screens/components/gap.dart';
import 'package:confio/services/authentication_service.dart';
import 'package:confio/services/storage_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AccountInfoScreen extends StatelessWidget {
  const AccountInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 428,
        height: 926,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 28, 34, 82), Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            const Gap(
              height: 0.05,
            ),
            Row(
              children: [
                const Gap(
                  width: 0.05,
                ),
                Image.asset(
                  "assets/images/logo.png",
                ),
                const Spacer(),
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
                    height: 25.h,
                    width: 25.w,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/notification.png"),
                            fit: BoxFit.scaleDown)),
                  ),
                ),
              ],
            ),
            const Gap(
              height: 0.15,
            ),
            FutureBuilder(
                future: authenticationService.currentConfioUser,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return FutureBuilder(
                        future: storageService.getProfilePic(snapshot.data!),
                        builder: (context, snapshot1) {
                          if (snapshot1.hasData) {
                            return CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  MemoryImage(snapshot1.data!) as ImageProvider,
                            );
                          }
                          return const CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(
                              "assets/images/blankuser.png",
                            ),
                          );
                        });
                  }
                  return CircularProgressIndicator();
                }),
            const Gap(
              height: 0.05,
            ),
            Container(
              width: 340,
              height: 56,
              decoration: ShapeDecoration(
                color: Colors.white.withOpacity(0.05999999865889549),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: Colors.white.withOpacity(0.07999999821186066),
                  ),
                  borderRadius: BorderRadius.circular(11),
                ),
              ),
              child: Column(
                children: [
                  const Gap(
                    height: 0.02,
                  ),
                  FutureBuilder(
                      future: authenticationService.currentConfioUser,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            snapshot.data!.email!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w600,
                            ),
                          );
                        }
                        return CircularProgressIndicator();
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
