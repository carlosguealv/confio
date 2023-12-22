import 'package:confio/logic/blocs/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordBloc(),
      child: const ForgotLayout(),
    );
  }
}

class ForgotLayout extends StatefulWidget {
  const ForgotLayout({super.key});

  @override
  State<ForgotLayout> createState() => _ForgotLayoutState();
}

class _ForgotLayoutState extends State<ForgotLayout> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
        bloc: BlocProvider.of<ForgotPasswordBloc>(context),
        builder: (context, state) {
          if (state is ForgotPasswordLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Scaffold(
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images/Dark.png",
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
                            SvgPicture.asset("assets/images/back.svg"),
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
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Enter registered mail\nto ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23.77.sp,
                                fontFamily: 'PoppinsSemiBold',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: 'reset password',
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
                        height: 40.h,
                      ),
                      TextField(
                        onSubmitted: (value) {
                          BlocProvider.of<ForgotPasswordBloc>(context)
                              .add(ForgotPassword(email: emailController.text));
                        },
                        controller: emailController,
                        autofocus: true,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontFamily: 'PoppinsSemiBold',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.12,
                        ),
                        cursorColor: const Color(0xff7893FF),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'example@gmail.com',
                          hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.3100000023841858),
                            fontSize: 20.sp,
                            fontFamily: 'PoppinsSemiBold',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.12,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 600.h,
                      ),
                      InkWell(
                        onTap: () {
                          BlocProvider.of<ForgotPasswordBloc>(context)
                              .add(ForgotPassword(email: emailController.text));
                        },
                        child: Container(
                          width: double.infinity,
                          height: 58.h,
                          alignment: Alignment.center,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Text(
                            'Enviar email de confirmación',
                            style: TextStyle(
                              color: const Color(0xFF040406),
                              fontSize: 14.63.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.37,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
