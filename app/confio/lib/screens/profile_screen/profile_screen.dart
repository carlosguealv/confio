import 'package:confio/screens/home_screen/navbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.black, // keeps the background color as black
  //     body: SafeArea(
  //       child: Stack(
  //         children: [
  //           Positioned(
  //             top: 0, // position at the top of the stack
  //             left: 0, // position at the start of the screen (left for LTR layouts)
  //             right: 0, // also position at the end of the screen (right for LTR layouts)
  //             child: Padding(
  //               padding: const EdgeInsets.all(20.0),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   // Logo "Confio"
  //                   Text(
  //                     "Confio",
  //                     style: GoogleFonts.delaGothicOne(
  //                         fontSize: 36, color: Color(0xff7893FF)), // make sure the color is correctly defined
  //                   ),
  //                   // Notification and Settings icons
  //                   Row(
  //                     children: [
  //                       GestureDetector(
  //                         onTap: () {
  //                           // TODO: Implement your navigation or other logic here
  //                           print('Notification icon tapped!');
  //                         },
  //                         child: Image.asset(
  //                           "lib/assets/images/notification.png",
  //                           width: 25, // defines the width of the image
  //                           height: 25, // defines the height of the image
  //                         ),
  //                       ),
  //                       SizedBox(width: 12), // spacing between the icons
  //                       GestureDetector(
  //                         onTap: () {
  //                           // TODO: Implement your navigation or other logic here
  //                           print('Settings icon tapped!');
  //                         },
  //                         child: Image.asset(
  //                           "lib/assets/images/Setting.png",
  //                           width: 25, // defines the width of the image
  //                           height: 25, // defines the height of the image
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //           // ... other widgets ...
  //         ],
  //       ),
  //     ),
  //   );
  // }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,  // keeps the background color as black
      body: SafeArea(
        child: Stack(
          children: [
            // Positioned elements in the stack will be displayed on top of each other.
            // We need to make sure the logo and icons are not being obscured by other widgets.
            Positioned(
              top: 0, // position at the top of the stack
              left: 0, // position at the start of the screen (left for LTR layouts)
              right: 0, // also position at the end of the screen (right for LTR layouts)
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Logo "Confio"
                    Text(
                      "Confio",
                      style: GoogleFonts.delaGothicOne(
                          fontSize: 36, color: Color(0xff7893FF)), // make sure the color is correctly defined
                    ),
                    // Notification and Settings icons
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // action for notification tap
                            print('Notification icon tapped!');
                          },
                          child: Image.asset(
                            "lib/assets/images/notification.png",
                            width: 25, // defines the width of the image
                            height: 25, // defines the height of the image
                            // make sure the asset is correctly loaded
                          ),
                        ),
                        SizedBox(width: 12), // spacing between the icons
                        GestureDetector(
                          onTap: () {
                            // action for settings tap
                            print('settings icon tapped!');
                          },
                          child: Image.asset(
                            "lib/assets/images/Setting.png",
                            width: 25, // defines the width of the image
                            height: 25, // defines the height of the image
                            // make sure the asset is correctly loaded
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Other positioned widgets or containers in the stack...
            // Make sure they do not overlap completely with the top positioned widget
            Positioned.fill(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: NavBar(
                      currentIndex: 2, // this was set in your original profile screen code
                    )
                )
            ),
          ],
        ),
      ),
    );
  }

}
