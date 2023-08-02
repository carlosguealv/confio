import 'package:confio/logic/blocs/login_bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (BuildContext context) => LoginBloc(),
        child: const LoginLayout(),
      ),
    );
  }
}

class LoginLayout extends StatelessWidget {
  const LoginLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            radius: 1.5,
            colors: [Colors.white, Color(0xFF3550DA)],
            center: Alignment(0, 1),
          ),
        ),
        padding: const EdgeInsets.all(35),
        child: Stack(
          children: [
            Align(
              alignment: const Alignment(0, -0.5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child:Image.asset('lib/assets/images/shorthairwoman.png'),
              )
            ),
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
              alignment: const Alignment(0, 0.62),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8E95F1),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                ),
                onPressed: () {  },
                child: const Text("Continuar"),
              ),),
            ),
          ]
        ),)
      )
    );
  }
}
