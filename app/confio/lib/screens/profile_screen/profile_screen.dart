import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confio/models/confio_user.dart';
import 'package:confio/screens/components/gap.dart';
import 'package:confio/services/firebase_service.dart';
import 'package:confio/services/storage_service.dart';
import 'package:confio/utils/size_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:confio/services/authentication_service.dart';
import 'package:confio/screens/home_screen/navbar.dart';

const themeColor = Color(0xff7893FF);

enum RecordMode {
  payer,
  payee
} // Place the enum definition here, outside of any class

class PaymentRecordButton extends StatelessWidget {
  final String label;
  final String count;
  final Color color; // This will be used for the background color of the button
  final VoidCallback onTap; // This is the callback that will be called on tap
  final bool outlined;

  const PaymentRecordButton({
    super.key,
    required this.label,
    required this.count,
    required this.color, // Color is now required
    required this.onTap, // onTap callback is now required
    required this.outlined,
  });

  @override
  Widget build(BuildContext context) {
    // GestureDetector wraps the entire Container to make it tappable
    return GestureDetector(
      onTap: onTap,
      // outline container only if outlined is true
      child: Container(
        width: sy! * 0.25,
        height: sx! * 0.15,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color, // Use the passed color for the background
          borderRadius: BorderRadius.circular(9),
          border: outlined
              ? Border.all(
                  color: const Color(0xCEB7EEEB),
                  width: 1.5,
                )
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 37,
              height: 37,
              decoration: const ShapeDecoration(
                color: Color(0xFFB9F1EE),
                shape: OvalBorder(),
              ),
              child: label == "Pagadores"
                  ? Image.asset("lib/assets/images/Group.png",
                      width: 15, height: 15)
                  : Image.asset("lib/assets/images/Vector.png",
                      width: 15, height: 15),
            ),
            const SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(
                color: Colors.white.withOpacity(0.3100000023841858),
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                height: 0,
                letterSpacing: 0.36,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              count,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'IBM Plex Mono',
                fontWeight: FontWeight.w500,
                height: 0,
                letterSpacing: 0.90,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  RecordMode mode = RecordMode.payer;
  Uint8List? _image;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;

    final Uint8List bytes = await image.readAsBytes();

    final ConfioUser? currentUser =
        await authenticationService.currentConfioUser;

    storageService.uploadProfilePicture(currentUser!, bytes);
    setState(() {
      _image = bytes;
    });
  }

  @override
  void initState() {
    super.initState();
    authenticationService.currentConfioUser.then((user) {
      storageService.getProfilePic(user!).then((value) {
        setState(() {
          _image = value;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double circleRadius =
        MediaQuery.of(context).size.width * 0.125; // Reduced by 30%

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: sx! * 0.025,
              left: sy! * 0.05,
              child: Image.asset(
                "lib/assets/images/logo.png",
              ),
            ),
            Positioned(
              top: sx! * 0.04,
              right: sy! * 0.05,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      print('Notification icon tapped!');
                    },
                    child: Image.asset(
                      "lib/assets/images/notification.png",
                      width: 25.w,
                      height: 25.h,
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/settings');
                    },
                    child: Image.asset(
                      "lib/assets/images/Setting.png",
                      width: 25.w,
                      height: 25.h,
                    ),
                  ),
                ],
              ),
            ),
            Positioned.fill(
              top: MediaQuery.of(context).size.height * 0.15,
              child: Align(
                alignment: Alignment.topCenter,
                child: CircleAvatar(
                  radius: circleRadius,
                  backgroundColor: Colors.white,
                  backgroundImage: _image != null
                      ? MemoryImage(_image!) as ImageProvider<Object>
                      : const AssetImage("lib/assets/images/blankuser.png"),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.13 +
                  (2 * circleRadius) -
                  20,
              left:
                  MediaQuery.of(context).size.width * 0.45 + circleRadius - 20,
              child: FloatingActionButton(
                onPressed: _pickImage,
                backgroundColor: Colors.black,
                mini: true,
                child: const Icon(Icons.add_a_photo, size: 28),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.15 +
                      (2 * circleRadius) +
                      20,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        authenticationService.currentUser!.email!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                        ),
                      ),
                      SizedBox(
                          height: sx! * 0.025), // Spacing between the two texts
                      Text(
                        "Ver registros de pagos",
                        style: TextStyle(
                          color:
                              Colors.white.withOpacity(0.7), // Less bright white
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                          height: sx! * 0.025), // Spacing between the two texts
                      // Inside the ProfileScreen's build method, after "Ver registros de pagos"
                      Row(
                        children: [
                          const Gap(
                            width: 0.225,
                          ),
                          FutureBuilder(
                            future: authenticationService.currentConfioUser,
                            builder: (context, snapshot) {
                              return PaymentRecordButton(
                                label: 'Pagadores',
                                count: snapshot.data!.payers.length.toString(),
                                color: const Color.fromARGB(170, 66, 66, 66),
                                onTap: () {
                                  setState(() {
                                    mode = RecordMode.payer;
                                  });
                                },
                                outlined: mode == RecordMode.payer,
                              );
                            }
                          ),
                          const Gap(
                            width: 0.05,
                          ),
                          FutureBuilder(
                            future: authenticationService.currentConfioUser,
                            builder: (context, snapshot) {
                              return PaymentRecordButton(
                                label: 'Cobradores',
                                count: snapshot.data!.payees.length.toString(),
                                color: const Color.fromARGB(170, 66, 66, 66),
                                onTap: () {
                                  setState(() {
                                    mode = RecordMode.payee;
                                  });
                                },
                                outlined: mode == RecordMode.payee,
                              );
                            }
                          ),
                        ],
                      ),
                      const Gap(
                        height: 0.05,
                      ),
                      GestureDetector(
                        onTap: () => print('Invite button tapped!'),
                        child: SizedBox(
                          width: 388,
                          height: 59,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 388,
                                  height: 59,
                                  decoration: ShapeDecoration(
                                    color: Colors.white
                                        .withOpacity(0.03999999910593033),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1.22,
                                        color: Colors.white
                                            .withOpacity(0.07999999821186066),
                                      ),
                                      borderRadius: BorderRadius.circular(12.16),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 58,
                                top: 30,
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Invita a otros ',
                                        style: TextStyle(
                                          color: Colors.white
                                              .withOpacity(0.44999998807907104),
                                          fontSize: 13,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                          height: 0.12,
                                          letterSpacing: 0.24,
                                        ),
                                      ),
                                      const TextSpan(
                                        text: 'pagadores',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                          height: 0.12,
                                          letterSpacing: 0.24,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' or ',
                                        style: TextStyle(
                                          color: Colors.white
                                              .withOpacity(0.44999998807907104),
                                          fontSize: 13,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                          height: 0.12,
                                          letterSpacing: 0.24,
                                        ),
                                      ),
                                      const TextSpan(
                                        text: 'cobradores',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                          height: 0.12,
                                          letterSpacing: 0.24,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 13,
                                top: 16,
                                child: SizedBox(
                                  width: 27.97,
                                  height: 27.97,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          width: 27.97,
                                          height: 27.97,
                                          decoration: ShapeDecoration(
                                            color: Colors.white
                                                .withOpacity(0.05000000074505806),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.32),
                                            ),
                                          ),
                                          child: Image.asset(
                                            "lib/assets/images/invite.png",
                                            width: 27.97,
                                            height: 27.97,
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
                      ),
                      const Gap(
                        height: 0.05,
                      ),
                      Text(
                        'Tus ${mode == RecordMode.payer ? 'pagadores' : 'cobradores'}',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.44999998807907104),
                          fontSize: 16,
                          fontFamily: 'Roboto Mono',
                          fontWeight: FontWeight.w700,
                          height: 0.12,
                          letterSpacing: 0.90,
                        ),
                      ),
                      const Gap(
                        height: 0.05,
                      ),
                      // Item list with item count equal to the amount of payer or payees (depending on the mode)
                      FutureBuilder(
                        future: authenticationService.currentConfioUser,
                        builder: (context, snapshot) {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: mode == RecordMode.payer
                                ? snapshot.data!.payers.length
                                : snapshot.data!.payees.length,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 388,
                                height: 77,
                                decoration: ShapeDecoration(
                                  color: const Color(0x66202227),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1,
                                      color: Colors.white
                                          .withOpacity(0.03999999910593033),
                                    ),
                                    borderRadius: BorderRadius.circular(17),
                                  ),
                                ),
                                child: Row(children: [
                                  FutureBuilder(
                                    future: firebaseService.getUserByUid(
                                        mode == RecordMode.payer
                                            ? snapshot.data!.payers[index]!
                                            : snapshot.data!.payees[index]!),
                                    builder: (context, snapshot1) {
                                      return FutureBuilder(
                                          future: storageService.getProfilePic(
                                              ConfioUser.fromDocument(
                                                  snapshot1.data!)),
                                          builder: (context, snapshot2) {
                                            return Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    const Gap(
                                                      width: 0.05,
                                                    ),
                                                    CircleAvatar(
                                                      radius: 20,
                                                      backgroundColor: Colors.white,
                                                      backgroundImage: snapshot2
                                                                  .data !=
                                                              null
                                                          ? MemoryImage(
                                                                  snapshot2.data!)
                                                              as ImageProvider<
                                                                  Object>
                                                          : const AssetImage(
                                                              "lib/assets/images/blankuser.png"),
                                                    ),
                                                    const Gap(
                                                      width: 0.05,
                                                    ),
                                                    Text(
                                                      ConfioUser.fromDocument(
                                                              snapshot1.data!)
                                                          .email!,
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontFamily: 'Roboto Mono',
                                                        fontWeight: FontWeight.w700,
                                                        height: 0.12,
                                                        letterSpacing: 0.90,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Gap(
                                                  height: 0.05,
                                                ),
                                              ],
                                            );
                                          });
                                    },
                                  ),
                                ]),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: NavBar(
                  currentIndex: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
