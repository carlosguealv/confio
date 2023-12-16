import 'package:confio/logic/blocs/signup_bloc/signup_bloc.dart';
import 'package:confio/screens/auth/widgets/auth_text_field.dart';
import 'package:confio/services/authentication_service.dart';
import 'package:confio/utils/size_config.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupBloc(),
      child: const SignupLayout(),
    );
  }
}

class SignupLayout extends StatefulWidget {
  const SignupLayout({super.key});

  @override
  State<SignupLayout> createState() => _SignupLayoutState();
}

class _SignupLayoutState extends State<SignupLayout> {
  bool isChecked = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  @override
  void initState() {
    isChecked = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: BlocProvider.of<SignupBloc>(context),
      listener: (context, state) {
        if (state is SignupSuccess) {
          Get.toNamed('/home');
          Get.snackbar("Tu cuenta fue creada con éxito",
              "Te hemos enviado un correo de confirmación");
          authenticationService.sendEmailForVerificationToCurrentUser();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocBuilder(
            bloc: BlocProvider.of<SignupBloc>(context),
            builder: (context, state) {
              if (state is SignupLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Container(
                height: sx! * 1,
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
                                text: 'Please enter below\ndetails to ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23.77.sp,
                                  fontFamily: 'PoppinsSemiBold',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: 'Register',
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
                            'To enter the app please enter your\nemail and password correctly',
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
                            context: context,
                            controller: emailController),
                        AuthTextFieldContainer(
                            isPassword: true,
                            label: 'Password',
                            context: context,
                            controller: passwordController),
                        AuthTextFieldContainer(
                            isPassword: true,
                            label: 'Confirm Password',
                            context: context,
                            controller: confirmpasswordController),
                        SizedBox(
                          height: 125.h,
                        ),
                        Divider(
                          thickness: 1.w,
                          color: const Color(0xff4f4f51),
                        ),
                        SizedBox(
                          height: 44.h,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isChecked = !isChecked;
                            });
                          },
                          child: Container(
                            width: 25,
                            height: 25,
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color:
                                  Colors.white.withOpacity(0.05999999865889549),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1, color: Color(0xFFCFD0D0)),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: isChecked
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  )
                                : null,
                          ),
                        ),
                        SizedBox(
                          height: 21.h,
                        ),
                        SizedBox(
                          width: 312.w,
                          height: 60.h,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'By continuing, you accept to our ',
                                  style: TextStyle(
                                    color: Colors.white
                                        .withOpacity(0.44999998807907104),
                                    fontSize: 12.40.sp,
                                    fontFamily: 'PoppinsSemiBold',
                                    fontWeight: FontWeight.w600,
                                    height: 1.9,
                                    letterSpacing: 0.31,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Terms and Conditions',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.40.sp,
                                    fontFamily: 'PoppinsSemiBold',
                                    fontWeight: FontWeight.w600,
                                    height: 1.9,
                                    letterSpacing: 0.31,
                                  ),
                                ),
                                TextSpan(
                                  text: ' and ',
                                  style: TextStyle(
                                    color: Colors.white
                                        .withOpacity(0.44999998807907104),
                                    fontSize: 12.40.sp,
                                    fontFamily: 'PoppinsSemiBold',
                                    fontWeight: FontWeight.w600,
                                    height: 1.9,
                                    letterSpacing: 0.31,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Privacy Policy',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.40.sp,
                                    fontFamily: 'PoppinsSemiBold',
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.31,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 44.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (passwordController.text !=
                                confirmpasswordController.text) {
                              Get.snackbar('Error', 'Passwords do not match');
                              return;
                            } else if (!isChecked) {
                              Get.snackbar('Error',
                                  'Por favor, acepta nuestras pólizas');
                              return;
                            }
                            BlocProvider.of<SignupBloc>(context).add(Signup(
                              email: emailController.text,
                              password: passwordController.text,
                            ));
                          },
                          child: Container(
                            width: double.infinity,
                            height: 58.h,
                            decoration: ShapeDecoration(
                              color: const Color(0xFF7892FF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            alignment: Alignment.center,
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
                                  text: 'Already have an account?',
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
                                      Get.toNamed('/login');
                                    },
                                  text: ' Sign In',
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
              );
            }),
      ),
    );
  }
}
