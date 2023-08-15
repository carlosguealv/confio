import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
		return Scaffold(
			resizeToAvoidBottomInset: false,
			body: Center(
				child: Container(
					decoration: const BoxDecoration(
						gradient: LinearGradient(
							begin: Alignment.bottomCenter,
							end: Alignment.topCenter,
            	colors: [Colors.white, Color(0xFF3550DA)],
							stops: [0.3, 0.7]
            ),
					),
				),
			)
		);
  }
}
