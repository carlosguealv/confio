import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:confio/services/authentication_service.dart';

import '../home_screen/navbar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
        MediaQuery.of(context).size.width * 0.175; // Reduced by 30%

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 20.0,
              left: 20.0,
              child: Text(
                "Confio",
                style: GoogleFonts.delaGothicOne(
                    fontSize: 36, color: const Color(0xff7893FF)),
              ),
            ),
            Positioned(
              top: 36.0,
              right: 20.0,
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
                      : const AssetImage("lib/assets/images/white_circle.png"),
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



//
// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,  // keeps the background color as black
//       body: SafeArea(
//         child: Stack(
//           children: [
//             // Positioned elements in the stack will be displayed on top of each other.
//             Positioned(
//               top: 0, // position at the top of the stack
//               left: 0, // position at the start of the screen (left for LTR layouts)
//               right: 0, // also position at the end of the screen (right for LTR layout s)
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     // Logo "Confio"
//                     Text(
//                       "Confio",
//                       style: GoogleFonts.delaGothicOne(
//                           fontSize: 36, color: Color(0xff7893FF)), // make sure the color is correctly defined
//                     ),
//                     // Notification and Settings icons
//                     Row(
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             // action for notification tap
//                             print('Notification icon tapped!');
//                           },
//                           child: Image.asset(
//                             "lib/assets/images/notification.png",
//                             width: 25, // defines the width of the image
//                             height: 25, // defines the height of the image
//                             // make sure the asset is correctly loaded
//                           ),
//                         ),
//                         SizedBox(width: 12), // spacing between the icons
//                         GestureDetector(
//                           onTap: () {
//                             // action for settings tap
//                             print('settings icon tapped!');
//                           },
//                           child: Image.asset(
//                             "lib/assets/images/Setting.png",
//                             width: 25, // defines the width of the image
//                             height: 25, // defines the height of the image
//                             // make sure the asset is correctly loaded
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             // Other positioned widgets or containers in the stack...
//             // Make sure they do not overlap completely with the top positioned widget
//             Positioned.fill(
//                 child: Align(
//                     alignment: Alignment.bottomCenter,
//                     child: NavBar(
//                       currentIndex: 2, // this was set in your original profile screen code
//                     )
//                 )
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
// }
