import 'package:beamer/beamer.dart';
import 'package:confio/logic/blocs/signup_bloc/signup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});
  static final _provider = BlocProvider(
    create: (BuildContext context) => SignupBloc(),
    child: const SignupLayout(),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _provider,
    );
  }
}

class SignupLayout extends StatelessWidget {
  const SignupLayout({super.key});
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state is SignupFailure) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("No se pudo crear tu cuenta"),
            backgroundColor: Colors.red,
          ));
        } else if (state is SignupSuccess) {
          Beamer.of(context).beamToNamed('/home');
        } else if (state is SignupLoading) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Creando cuenta..."),
          ));
        }
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: Container(
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
              child: Stack(children: [
                Align(
                    alignment: const Alignment(0, -0.8),
                    child: Text(
                      "Confio",
                      style: GoogleFonts.delaGothicOne(
                        textStyle: const TextStyle(
                          fontSize: 30, color: Colors.white
                        )
                      ),
                    )
                ),
                Align(
                    alignment: const Alignment(0, -0.5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child:
                          Image.asset('lib/assets/images/blankuser.png'),
                    )
                ),
                Align(
                  alignment: const Alignment(0, 0.2),
                  child: TextField(
                    controller: emailController,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0)),
                      labelText: 'Correo electrónico',
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0, 0.41),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0)),
                      labelText: 'Contraseña',
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0, 0.62),
                  child: TextField(
                    controller: confirmController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0)),
                      labelText: 'Confirmar Contraseña',
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment(0, 0.83),
                  child: SizedBox(
                    width: double.infinity,
                    child: ContinueButton(),
                  ),
                ), 
              ]),
          )
        )
      )
    );
  }
}

class ContinueButton extends StatelessWidget {
  const ContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF8E95F1),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
      ),
      onPressed: () {
        if (SignupLayout.passwordController.text == SignupLayout.confirmController.text) {
          BlocProvider.of<SignupBloc>(context).add(Signup(
            email: SignupLayout.emailController.text,
            password: SignupLayout.passwordController.text));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Error: Las contraseñas no coinciden"),
              backgroundColor: Colors.red,
            ));
          }
      },
      child: const Text("Continuar"),
    );
  }
}
