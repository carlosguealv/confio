import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CollectTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  const CollectTextField({
    super.key,
    required this.controller,
    required this.labelText,
  });

  @override
  State<CollectTextField> createState() => _CollectTextFieldState();
}

class _CollectTextFieldState extends State<CollectTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17.sp,
            fontFamily: 'RobotoSemiBold',
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 10.sp,
        ),
        Container(
          width: double.infinity,
          height: 149.h,
          decoration: const BoxDecoration(color: Color(0xffD9D9D9)),
          child: TextField(
            style: const TextStyle(
                fontFamily: 'RobotoRegular',
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 15),
            keyboardType: TextInputType.multiline,
            controller: widget.controller,
            maxLines: null,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(
                    top: 10.h, left: 10.w, right: 10.w, bottom: 10.h)),
          ),
        )
      ],
    );
  }
}

