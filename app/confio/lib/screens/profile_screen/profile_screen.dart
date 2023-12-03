import 'package:confio/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:confio/services/authentication_service.dart';
import '../home_screen/navbar.dart';

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
    Key? key,
    required this.label,
    required this.count,
    required this.color, // Color is now required
    required this.onTap, // onTap callback is now required
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // GestureDetector wraps the entire Container to make it tappable
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color, // Use the passed color for the background
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              count,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
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
  XFile? _image;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
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
                      print('Settings icon tapped!');
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
                      ? FileImage(File(_image!.path)) as ImageProvider<Object>
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
                    const SizedBox(height: 10), // Spacing between the two texts
                    Text(
                      "Ver registros de pagos",
                      style: TextStyle(
                        color:
                            Colors.white.withOpacity(0.7), // Less bright white
                        fontSize: 16,
                      ),
                    ),
                    // Inside the ProfileScreen's build method, after "Ver registros de pagos"
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      childAspectRatio: (2.3),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      padding: const EdgeInsets.all(15),
                      children: <Widget>[
                        PaymentRecordButton(
                          label: 'Payers',
                          count: '10',
                          color: mode == RecordMode.payer
                              ? themeColor
                              : Colors.grey[900]!,
                          onTap: () {
                            setState(() {
                              mode = RecordMode.payer;
                            });
                          },
                        ),
                        PaymentRecordButton(
                          label: 'Payee',
                          count: '17',
                          color: mode == RecordMode.payee
                              ? themeColor
                              : Colors.grey[900]!,
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
