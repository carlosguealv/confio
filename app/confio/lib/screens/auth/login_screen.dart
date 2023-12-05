import 'package:confio/logic/blocs/login_bloc/login_bloc.dart';
import 'package:confio/screens/auth/widgets/auth_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: const LoginLayout(),
    );
  }
}

class LoginLayout extends StatefulWidget {
  const LoginLayout({super.key});

  @override
  State<LoginLayout> createState() => _LoginLayoutState();
}

class _LoginLayoutState extends State<LoginLayout> {
  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController passwordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      bloc: BlocProvider.of<LoginBloc>(context),
      listener: (context, state) {
        if (state is LoginSuccess) {
          Get.toNamed('/home');
        }
      },
      child: BlocBuilder(
          bloc: BlocProvider.of<LoginBloc>(context),
          builder: (context, state) {
            if (state is LoginLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Scaffold(
                resizeToAvoidBottomInset: false,
                body: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            "lib/assets/images/Dark.png",
                          ),
                          fit: BoxFit.cover)),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 48.h,
                        right: 48.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 60.h),
                          GestureDetector(
                            onTap: () {
                              print("object");
                              Get.back();
                            },
                            child: Row(
                              children: [
                                SvgPicture.asset("lib/assets/images/back.svg"),
                                SizedBox(
                                  width: 9.w,
                                ),
                                Text(
                                  "Back",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.47.sp,
                                    fontFamily: 'PoppinsSemiBold',
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.56,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Text.rich(
                            textAlign: TextAlign.left,
                            TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      'Por favor rellena tu información para ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23.77.sp,
                                    fontFamily: 'PoppinsSemiBold',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Iniciar sesión',
                                  style: TextStyle(
                                    color: const Color(0xFF7892FF),
                                    fontSize: 23.77.sp,
                                    fontFamily: 'PoppinsSemiBold',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          SizedBox(
                            width: 330.w,
                            height: 59.42.h,
                            child: Text(
                              'Para iniciar sesión, ingrese su correo electrónico y contraseña.',
                              style: TextStyle(
                                color: const Color(0xFF8C8E8F),
                                fontSize: 13.sp,
                                fontFamily: 'PoppinsRegular',
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                                letterSpacing: 0.07,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          AuthTextFieldContainer(
                              isPassword: false,
                              label: 'Email Address',
                              controller: emailController,
                              context: context),
                          AuthTextFieldContainer(
                              isPassword: true,
                              label: 'Password',
                              controller: passwordController,
                              context: context),
                          SizedBox(
                            height: 28.h,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Forgot Password?',
                                    style: TextStyle(
                                      color: Colors.white
                                          .withOpacity(0.3199999928474426),
                                      fontSize: 14.sp,
                                      fontFamily: 'PoppinsRegular',
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.07,
                                    ),
                                  ),
                                  TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Get.toNamed('/forgot');
                                      },
                                    text: ' Recover',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                      fontFamily: 'PoppinsMedium',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.07,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 288.h,
                          ),
                          Divider(
                            thickness: 1.w,
                            color: const Color(0xff4f4f51),
                          ),
                          SizedBox(
                            height: 44.h,
                          ),
                          Container(
                            width: double.infinity,
                            height: 58.h,
                            decoration: ShapeDecoration(
                              color: const Color(0xFF7892FF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: TextButton(
                              onPressed: () {
                                BlocProvider.of<LoginBloc>(context).add(Login(
                                    email: emailController.text,
                                    password: passwordController.text));
                              },
                              child: Text(
                                'Continue',
                                style: TextStyle(
                                  color: const Color(0xFF040406),
                                  fontSize: 14.63.sp,
                                  fontFamily: 'PoppinsSemiBold',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.37,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 39.h,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Don\'t have an account?',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                      fontFamily: 'PoppinsMedium',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.07,
                                    ),
                                  ),
                                  TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Get.toNamed('/signup');
                                      },
                                    text: ' Sign Up',
                                    style: TextStyle(
                                      color: const Color(0xFF6D75D7),
                                      fontSize: 14.sp,
                                      fontFamily: 'PoppinsMedium',
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.07,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
          }),
    );
  }
}
