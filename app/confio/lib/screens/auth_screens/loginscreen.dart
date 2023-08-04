import 'package:confio/logic/blocs/login_bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static final _provider = BlocProvider(
    create: (BuildContext context) => LoginBloc(),
    child: const LoginLayout(),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _provider,
    );
  }
}

class LoginLayout extends StatelessWidget {
  const LoginLayout({super.key});
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Login Failed"),
            ));
          } else if (state is LoginSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Login Succeeded"),
            ));
          } else if (state is LoginLoading) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Login Loading"),
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
                    child: Text("Confio", style: GoogleFonts.delaGothicOne(textStyle: const TextStyle(fontSize: 30, color: Colors.white)),) 
                ),
                Align(
                    alignment: const Alignment(0, -0.5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child:
                          Image.asset('lib/assets/images/shorthairwoman.png'),
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
                const Align(
                  alignment: Alignment(0, 0.62),
                  child: SizedBox(
                    width: double.infinity,
                    child: ContinueButton(),
                  ),
                ),
              ]),
            ))));
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
        BlocProvider.of<LoginBloc>(context)
                    .add(Login(email: LoginLayout.emailController.text,
                              password: LoginLayout.passwordController.text));
      },
      child: const Text("Continuar"),
    );
  }
}
