import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            radius: 1,
            colors: [Colors.white, Color(0xFF3550DA)],
            center: Alignment(0, 1),
          ),
        ),
        padding: const EdgeInsets.all(35),
        child: Stack(
          children: [
            Align(
              alignment: const Alignment(0, 0.2),
              child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)),
                labelText: 'Correo electrónico',
              ),
            ),),
            Align(
              alignment: const Alignment(0, 0.41),
              child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)),
                labelText: 'Contraseña',
              ),
            ),),
            Align(
              alignment: Alignment(0, 0.62),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Color(0xFF8E95F1)),
                onPressed: () { },
                child: Text("Continuar"),
              ),
            ),
          ]
        ),)
      )
    );
  }
}
