import 'package:confio/logic/blocs/login_bloc/login_bloc.dart';
import 'package:confio/screens/components/gap.dart';
import 'package:confio/utils/size_config.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static final _provider = BlocProvider(
    create: (BuildContext context) => LoginBloc(),
    child: const LoginLayout(),
  );

  @override
  Widget build(BuildContext context) {
    return _provider;
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
              content: Text("No se pudo iniciar sesión"),
              backgroundColor: Colors.red,
            ));
          } else if (state is LoginSuccess) {
            Get.toNamed('/home');
          }
        },
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                if (state is LoginLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Center(
                    child: SingleChildScrollView(
                    child: Container(
                      height: sx! * 1.1,
                      width: sy! * 100,
                      decoration: const BoxDecoration(
                        gradient: RadialGradient(
                          radius: 1.5,
                          colors: [Colors.white, Color(0xFF3550DA)],
                          center: Alignment(0, 1),
                        ),
                      ),
                      padding: const EdgeInsets.all(35),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        const Flexible(
                          flex: 1,
                          child: Gap(
                            height: 0.09,
                          ),
                        ),
                        Text(
                          "Confio",
                          style: GoogleFonts.delaGothicOne(
                              textStyle: const TextStyle(
                                  fontSize: 30, color: Colors.white)),
                        ),
                        const Gap(
                          height: 0.04,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('lib/assets/images/blankuser.png'),
                        ),
                        const Gap(
                          height: 0.135,
                        ),
                        TextField(
                          controller: emailController,
                          obscureText: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0)),
                            labelText: 'Correo electrónico',
                          ),
                        ),
                        const Gap(
                          height: 0.02,
                        ),
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0)),
                            labelText: 'Contraseña',
                          ),
                        ),
                        const Gap(
                          height: 0.028,
                        ),
                        const SizedBox(
                          width: double.infinity,
                          child: ContinueButton(),
                        ),
                        const Gap(
                          height: 0.055,
                        ),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              const TextSpan(
                                  text: '¿Eres nuevo en Confio?',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 131, 109, 168))),
                              TextSpan(
                                  text: ' Crea una cuenta nueva',
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 131, 109, 168),
                                      fontWeight: FontWeight.bold),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.toNamed('/signup');
                                    }),
                            ],
                          ),
                        ),
                        const Gap(
                          height: 0.03,
                        ),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              const TextSpan(
                                  text: '¿Olvidaste tu contraseña?',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 131, 109, 168))),
                              TextSpan(
                                  text: ' Haz click aquí',
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 131, 109, 168),
                                      fontWeight: FontWeight.bold),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.toNamed('/forgot');
                                    }
															),
                            ],
                          ),
                        )
                      ]),
                    ),
                  ));
                }
              },
            )));
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
        BlocProvider.of<LoginBloc>(context).add(Login(
            email: LoginLayout.emailController.text,
            password: LoginLayout.passwordController.text));
      },
      child: const Text("Continuar"),
    );
  }
}
