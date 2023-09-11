import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:confio/logic/blocs/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

	static final _provider = BlocProvider(
    create: (BuildContext context) => ForgotPasswordBloc(),
    child: const ForgotPasswordLayout(),
  );

  @override
  Widget build(BuildContext context) {
		return MaterialApp(
			home: _provider,
		);
  }
}

class ForgotPasswordLayout extends StatelessWidget {
	const ForgotPasswordLayout({super.key});

	static TextEditingController emailController = TextEditingController();

	@override
	Widget build(BuildContext context) {
		return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
			builder: (context, state) {
				if (state is ForgotPasswordLoading) {
					return const Center(
						child: CircularProgressIndicator()
					);
				}	
				return Scaffold(
					body: Center(
						child: Container(
							width: double.infinity,
							height: double.infinity,
							decoration: const BoxDecoration(
								gradient: LinearGradient(
									begin: Alignment.topCenter,
									end: Alignment.bottomCenter,
									colors: [Color(0xFF3550DA), Colors.white],
									stops: [0.3, 0.5]
									
								),
							),
							padding: const EdgeInsets.all(35),
							child: Stack(
								children: [
									Align(
										alignment: const Alignment(0, -0.9),
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
										alignment: const Alignment(0, -0.7),
										child: Text(
                      "Resetear contraseña",
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold,
                        )
                      ),
                    )
									),
									Align(
										alignment: const Alignment(0, -0.5),
										child: SizedBox(
											width: double.infinity,
											child: Text(
												"Cambiar contraseña",
												style: GoogleFonts.roboto(
													textStyle: const TextStyle(
														fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold
													)
												),
											textAlign: TextAlign.left,
                    	)
										)
									),
									Align(
										alignment: const Alignment(0, -0.4),
										child: Text(
                      "Para cambiar tu contraseña, danos tu correo electrónico. Te enviaremos instrucciones para cambiar tu contraseña",
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          fontSize: 16, color: Colors.white
                        )
                      ),
                    )
									),
									Align(
										alignment: const Alignment(0, -0.1),
										child: TextField(
											controller: emailController,
											obscureText: false,
											decoration: const InputDecoration(
												labelText: 'Correo electrónico',
											),
										),
									),
									Align(
										alignment: const Alignment(0, 0.1),
										child: TextButton(
											child: const Text("Continuar"),
											onPressed: () {
												BlocProvider.of<ForgotPasswordBloc>(context).add(ForgotPassword(email: emailController.text));
											},
										)
									)
								],
							),
						)
					)
				);
			},
		);
	}
}
