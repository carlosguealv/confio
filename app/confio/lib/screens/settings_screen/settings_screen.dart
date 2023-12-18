import 'package:confio/screens/components/gap.dart';
import 'package:confio/services/authentication_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.black,
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
                    "lib/assets/images/logo.png",
                  ),
                ],
              ),
              const Gap(
                height: 0.05,
              ),
              Row(
                children: [
                  const Gap(
                    width: 0.05,
                  ),
                  Image.asset(
                    "lib/assets/images/Setting.png",
                    width: 25.w,
                    height: 25.h,
                  ),
                  const Gap(
                    width: 0.025,
                  ),
                  const Text(
                    'Settings',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.54,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0,
                      letterSpacing: 0.19,
                    ),
                  )
                ],
              ),
              const Gap(
                height: 0.05,
              ),
              // Account info button
              GestureDetector(
                onTap: () {
                  Get.toNamed('/account-info');
                },
                child: Row(
                  children: [
                    const Gap(
                      width: 0.05,
                    ),
                    Container(
                      width: 35,
                      height: 35,
                      decoration: ShapeDecoration(
                        color: Colors.white.withOpacity(0.09000000357627869),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)),
                      ),
                      child: Image.asset(
                        "lib/assets/images/2-User.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                    const Gap(
                      width: 0.05,
                    ),
                    Text(
                      'Info de la cuenta',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7699999809265137),
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        height: 0.22,
                      ),
                    ),
                    const Gap(
                      width: 0.50335,
                    ),
                    Image.asset(
                      "lib/assets/images/arrow_button.png",
                      width: 10,
                      height: 10,
                    ),
                  ],
                ),
              ),
              const Gap(
                height: 0.025,
              ),
              // Ask for help button
              GestureDetector(
                onTap: () {
                  print("Ask for help tapped");
                },
                child: Row(
                  children: [
                    const Gap(
                      width: 0.05,
                    ),
                    Container(
                      width: 35,
                      height: 35,
                      decoration: ShapeDecoration(
                        color: Colors.white.withOpacity(0.09000000357627869),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)),
                      ),
                      child: Image.asset(
                        "lib/assets/images/Danger-Circle.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                    const Gap(
                      width: 0.05,
                    ),
                    Text(
                      'Pedir Ayuda',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7699999809265137),
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        height: 0.22,
                      ),
                    ),
                    const Gap(
                      width: 0.58,
                    ),
                    Image.asset(
                      "lib/assets/images/arrow_button.png",
                      width: 10,
                      height: 10,
                    ),
                  ],
                ),
              ),
              const Gap(
                height: 0.025,
              ),
              // Data & Privacy button
              GestureDetector(
                onTap: () {
                  print("Data & Privacy button tapped");
                },
                child: Row(
                  children: [
                    const Gap(
                      width: 0.05,
                    ),
                    Container(
                      width: 35,
                      height: 35,
                      decoration: ShapeDecoration(
                        color: Colors.white.withOpacity(0.09000000357627869),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)),
                      ),
                      child: Image.asset(
                        "lib/assets/images/Lock.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                    const Gap(
                      width: 0.05,
                    ),
                    Text(
                      'Datos y Privacidad',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7699999809265137),
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        height: 0.22,
                      ),
                    ),
                    const Gap(
                      width: 0.467,
                    ),
                    Image.asset(
                      "lib/assets/images/arrow_button.png",
                      width: 10,
                      height: 10,
                    ),
                  ],
                ),
              ),
              const Gap(
                height: 0.025,
              ),
              // Notification preferences button
              GestureDetector(
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
                child: Row(
                  children: [
                    const Gap(
                      width: 0.05,
                    ),
                    Container(
                      width: 35,
                      height: 35,
                      decoration: ShapeDecoration(
                        color: Colors.white.withOpacity(0.09000000357627869),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)),
                      ),
                      child: Image.asset(
                        "lib/assets/images/Notification.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                    const Gap(
                      width: 0.05,
                    ),
                    Text(
                      'Preferencias de Notificación',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7699999809265137),
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        height: 0.22,
                      ),
                    ),
                    const Gap(
                      width: 0.305,
                    ),
                    Image.asset(
                      "lib/assets/images/arrow_button.png",
                      width: 10,
                      height: 10,
                    ),
                  ],
                ),
              ),
              const Gap(
                height: 0.03,
              ),
              Container(
                width: 388,
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const Gap(
                height: 0.03,
              ),
              // Log out button
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Cerrar Sesión"),
                          content: const Text(
                              "¿Estás seguro de que quieres cerrar sesión?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: const Text("Cancelar"),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.back();
                                authenticationService.signOutUser();
                                Get.offAllNamed('/auth-options');
                              },
                              child: const Text("Cerrar Sesión"),
                            ),
                          ],
                        );
                      });
                },
                child: Row(
                  children: [
                    const Gap(
                      width: 0.05,
                    ),
                    Container(
                      width: 35,
                      height: 35,
                      decoration: ShapeDecoration(
                        color: Colors.white.withOpacity(0.09000000357627869),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)),
                      ),
                      child: Image.asset(
                        "lib/assets/images/2-User.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                    const Gap(
                      width: 0.05,
                    ),
                    Text(
                      'Cerrar Sesión',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7699999809265137),
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        height: 0.22,
                      ),
                    ),
                    const Gap(
                      width: 0.55,
                    ),
                    Image.asset(
                      "lib/assets/images/arrow_button.png",
                      width: 10,
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
