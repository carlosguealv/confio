import 'package:confio/screens/components/gap.dart';
import 'package:confio/utils/size_config.dart';
import 'package:get/get.dart';
import 'package:confio/logic/blocs/signup_bloc/signup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});
  static final _provider = BlocProvider(
    create: (BuildContext context) => SignupBloc(),
    child: const SignupLayout(),
  );

  @override
  Widget build(BuildContext context) {
    return _provider;
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
            Get.toNamed('/home');
          }
        },
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: BlocBuilder<SignupBloc, SignupState>(
              builder: (context, state) {
                if (state is SignupLoading) {
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
                        const Gap(
                          height: 0.09,
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
                          height: 0.08,
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
                          height: 0.02,
                        ),
                        TextField(
                          controller: confirmController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0)),
                            labelText: 'Confirmar Contraseña',
                          ),
                        ),
                        const Gap(
                          height: 0.03,
                        ),
                        const SizedBox(
                          width: double.infinity,
                          child: ContinueButton(),
                        ),
                        const Gap(
                          height: 0.01,
                        ),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                const TextSpan(
                                    text: '¿Ya tienes una cuenta?',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 131, 109, 168))),
                                TextSpan(
                                    text: ' Inicia sesión aquí',
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 131, 109, 168),
                                        fontWeight: FontWeight.bold),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Get.toNamed('/login');
                                      }),
                              ],
                            ),
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
        if (SignupLayout.passwordController.text ==
            SignupLayout.confirmController.text) {
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
