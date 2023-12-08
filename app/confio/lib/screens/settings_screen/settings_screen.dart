import 'package:confio/screens/components/gap.dart';
import 'package:flutter/material.dart';

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
                    width: 25,
                    height: 25,
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
                  print("Account info button tapped");
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
                      'Account Info',
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
