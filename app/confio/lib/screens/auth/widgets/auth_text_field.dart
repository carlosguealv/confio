import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTextFieldContainer extends StatefulWidget {
  const AuthTextFieldContainer({
    super.key,
    required this.isPassword,
    required this.label,
    required this.controller,
    required this.context,
  });

  final bool isPassword;
  final String label;
  final TextEditingController controller;
  final BuildContext context;

  @override
  State<AuthTextFieldContainer> createState() => _AuthTextFieldContainerState();
}

class _AuthTextFieldContainerState extends State<AuthTextFieldContainer> {
  bool isShown = true;
  @override
  void initState() {
    super.initState();
    isShown = false;
  }

  @override
  Widget build(BuildContext context) {
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
          onTapOutside: (event) => print("your mom"),
          obscureText: widget.isPassword ? !isShown : false,
          controller: widget.controller,
          cursorColor: const Color(0xff7893FF),
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontFamily: 'PoppinsRegular',
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
              suffixIcon: widget.isPassword == true
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isShown = !isShown;
                        });
                      },
                      icon: isShown == true
                          ? const Icon(
                              Icons.visibility_off,
                              color: Colors.white,
                            )
                          : const Icon(
                              Icons.visibility_outlined,
                              color: Colors.white,
                            ))
                  : null,
              hintText: widget.label,
              hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.3499999940395355),
                fontSize: 14.sp,
                fontFamily: 'PoppinsRegular',
                fontWeight: FontWeight.w500,
              ),
              contentPadding: widget.isPassword == false
                  ? EdgeInsets.only(left: 21.w, bottom: 10.h)
                  : EdgeInsets.only(left: 21.w, top: 13.h),
              border: InputBorder.none),
        ),
      ),
    );
  }
}
