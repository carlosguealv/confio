import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthOptionScreen extends StatelessWidget {
  const AuthOptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              radius: 0.75,
              colors: [Colors.white, Color(0xFF3550DA)],
              center: Alignment(0, 1),
            ),
          ),
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(35),
          child: Stack(
            children: [
              Align(
                alignment: const Alignment(0, -0.6),
                child: Text(
                  "Confio",
                  style: GoogleFonts.delaGothicOne(
                    textStyle: const TextStyle(
                      fontSize: 55, color: Colors.white
                    )
                  ),
                )
              ),
              Align(
                alignment: const Alignment(0, -0.2),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child:
                    Image.asset('lib/assets/images/blankuser.png', width: 100, height: 100),
                )
              ),
              Align(
                alignment: const Alignment(0, 0.2),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(112, 126, 233, 1),
                        shape:
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                      ),
                      child: const Text("Crear una cuenta"),
                      onPressed: () {
                      	Get.toNamed('/signup');
                      },
                  ),
                )
              ),
              Align(
                alignment: const Alignment(0, 0.4),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(112, 126, 233, 1),
                        shape:
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                      ),
                      child: const Text("Ya tengo una cuenta"),
                      onPressed: () {
                        Get.toNamed('/login');
                      },
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
