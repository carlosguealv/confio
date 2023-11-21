import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDivider extends StatefulWidget {
  const CustomDivider({super.key});

  @override
  State<CustomDivider> createState() => _CustomDividerState();
}

class _CustomDividerState extends State<CustomDivider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 388.w,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 0.50.w,
            strokeAlign: BorderSide.strokeAlignCenter,
            color: const Color(0xff1a1a1a),
          ),
        ),
      ),
    );
  }
}
