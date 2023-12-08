import 'package:confio/models/confio_user.dart';
import 'package:confio/screens/components/gap.dart';
import 'package:confio/services/storage_service.dart';
import 'package:confio/utils/size_config.dart';
import 'package:flutter/material.dart';
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

  const PaymentRecordButton({
    super.key,
    required this.label,
    required this.count,
    required this.color, // Color is now required
    required this.onTap, // onTap callback is now required
  });

  @override
  Widget build(BuildContext context) {
    // GestureDetector wraps the entire Container to make it tappable
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: sy! * 0.25,
        height: sx! * 0.15,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color, // Use the passed color for the background
          borderRadius: BorderRadius.circular(9),
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
  File? _image;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    final ConfioUser? currentUser =
        await authenticationService.currentConfioUser;
    storageService.uploadProfilePicture(currentUser!, File(image!.path));
    setState(() {
      _image = File(image.path);
    });
  }

  @override
  void initState() {
    super.initState();
    authenticationService.currentConfioUser.then((user) {
      storageService.getProfilePic(user!).then((value) {
        setState(() {
          print(value);
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
              top: sx! * 0.03,
              right: sy! * 0.05,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      print('Notification icon tapped!');
                    },
                    child: Image.asset(
                      "lib/assets/images/notification.png",
                      width: 25,
                      height: 25,
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/settings');
                    },
                    child: Image.asset(
                      "lib/assets/images/Setting.png",
                      width: 25,
                      height: 25,
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
                      ? FileImage(_image!) as ImageProvider<Object>
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
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: NavBar(
                  currentIndex: 2,
                ),
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
                        PaymentRecordButton(
                          label: 'Pagadores',
                          count: '10',
                          color: const Color.fromARGB(170, 66, 66, 66),
                          onTap: () {
                            setState(() {
                              mode = RecordMode.payer;
                            });
                          },
                        ),
                        const Gap(
                          width: 0.05,
                        ),
                        PaymentRecordButton(
                          label: 'Cobradores',
                          count: '17',
                          color: const Color.fromARGB(170, 66, 66, 66),
                          onTap: () {
                            setState(() {
                              mode = RecordMode.payee;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
