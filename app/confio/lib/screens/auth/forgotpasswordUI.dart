import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ForgotPasswordUI extends StatefulWidget {
  const ForgotPasswordUI({super.key});

  @override
  State<ForgotPasswordUI> createState() => _ForgotPasswordUIState();
}

class _ForgotPasswordUIState extends State<ForgotPasswordUI> {
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
                  height: 40.h,
                ),
                TextField(
                  autofocus: true,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontFamily: 'PoppinsSemiBold',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.12,
                  ),
                  cursorColor: Color(0xff7893FF),
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
                  onTap: (){
                    //sends OTP to the mail
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
                      'Send OTP',
                      style: TextStyle(
                        color: Color(0xFF040406),
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
  }
}
