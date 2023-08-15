import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:confio/logic/blocs/forgot_password_bloc/forgot_password_bloc.dart';

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
							decoration: const BoxDecoration(
								gradient: LinearGradient(
                  colors: [Colors.white, Color(0xFF3550DA)],
								),
							),
							padding: const EdgeInsets.all(35),
						)
					)
				);
			},
		);
	}
}
