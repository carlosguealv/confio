import 'package:confio/screens/home_screen/navbar.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Positioned.fill(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: NavBar(
                    currentIndex: 2,
                  ))),
        ],
      )),
    );
  }
}
