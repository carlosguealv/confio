import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GreetingScreen extends StatelessWidget {
  const GreetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              radius: 1.5,
              colors: [Colors.white, Color(0xFF3550DA)],
              center: Alignment(0, 1),
            ),
          ),
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(35),
          child: Stack(
            children: [
              Align(
                alignment: const Alignment(0, -0.4),
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
                alignment: const Alignment(0, -0.1),
                child: Text(
                  "¡Te damos la bienvenida a Confio!",
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold,
                    )
                  ),
                )
              ),
              Align(
                alignment: const Alignment(0, 0.1),
                child: Text(
                  "Contigo crece cada vez más la comunidad confio en todo Perú.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      fontSize: 14, color: Colors.white,
                    )
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
                    child: const Text("Comenzar"),
                    onPressed: () {
                      Beamer.of(context).beamToNamed('/auth-options');
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
