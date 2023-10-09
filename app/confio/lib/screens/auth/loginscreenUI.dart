import 'package:confio/screens/auth_screens/forgotpasswordUI.dart';
import 'package:confio/screens/auth_screens/signupscreenUI.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreenUI extends StatefulWidget {
  const LoginScreenUI({super.key});

  @override
  State<LoginScreenUI> createState() => _LoginScreenUIState();
}

class _LoginScreenUIState extends State<LoginScreenUI> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Row(
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
                        text: 'Login',
                        style: TextStyle(
                          color: Color(0xFF7892FF),
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
                      color: Color(0xFF8C8E8F),
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
                textfieldContainer(
                    isPassword: false,
                    label: 'Email Address',
                    context: context,
                    controller: emailController),
                textfieldContainer(
                    isPassword: true,
                    label: 'Password',
                    context: context,
                    controller: passwordController),
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
                            color: Colors.white.withOpacity(0.3199999928474426),
                            fontSize: 14.sp,
                            fontFamily: 'PoppinsRegular',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.07,
                          ),
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ForgotPasswordUI();
                              }));
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
                  color: Color(0xff4f4f51),
                ),
                SizedBox(
                  height: 44.h,
                ),
                Container(
                  width: double.infinity,
                  height: 58.h,
                  decoration: ShapeDecoration(
                    color: Color(0xFF7892FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color: Color(0xFF040406),
                      fontSize: 14.63.sp,
                      fontFamily: 'PoppinsSemiBold',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.37,
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
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return SignUpScreenUI();
                              }));
                            },
                          text: ' Sign Up',
                          style: TextStyle(
                            color: Color(0xFF6D75D7),
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

  Widget textfieldContainer(
      {required bool isPassword,
      required String label,
      required TextEditingController controller,
      required BuildContext context}) {
    bool isShown = false;
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Container(
        width: double.infinity.w,
        height: 56.h,
        decoration: ShapeDecoration(
          color: Colors.white.withOpacity(0.05999999865889549),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: Colors.white.withOpacity(0.07999999821186066),
            ),
            borderRadius: BorderRadius.circular(11),
          ),
        ),
        child: TextField(
          controller: controller,
          cursorColor: Color(0xff7893FF),
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontFamily: 'PoppinsRegular',
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
              suffixIcon: isPassword == true
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isShown = false;
                        });
                      },
                      icon: isShown == true
                          ? Icon(
                              Icons.visibility_off,
                              color: Colors.white,
                            )
                          : Icon(
                              Icons.visibility_outlined,
                              color: Colors.white,
                            ))
                  : null,
              hintText: label,
              hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.3499999940395355),
                fontSize: 14.sp,
                fontFamily: 'PoppinsRegular',
                fontWeight: FontWeight.w500,
              ),
              contentPadding: isPassword == false
                  ? EdgeInsets.only(left: 21.w, bottom: 10.h)
                  : EdgeInsets.only(left: 21.w, top: 13.h),
              border: InputBorder.none),
        ),
      ),
    );
  }
}
