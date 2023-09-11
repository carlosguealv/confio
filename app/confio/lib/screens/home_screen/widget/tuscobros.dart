import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TusCobrosWidget extends StatefulWidget {
  const TusCobrosWidget({super.key});

  @override
  State<TusCobrosWidget> createState() => _TusCobrosWidgetState();
}

class _TusCobrosWidgetState extends State<TusCobrosWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92.h,
      width: 388.w,
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff161719), width: 1.w),
          borderRadius: BorderRadius.circular(14.r),
          color: const Color(0xff0d0e10)),
      child: Padding(
        padding:
            EdgeInsets.only(left: 17.w, top: 18.5.h, right: 21.w, bottom: 18.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: ShapeDecoration(
                    color: Colors.white.withOpacity(0.029999999329447746),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 0.28,
                        color: Colors.white.withOpacity(0.05999999865889549),
                      ),
                      borderRadius: BorderRadius.circular(7.78),
                    ),
                  ),
                ),
                SizedBox(
                  width: 14.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Julio 2023',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 4,
                          height: 4,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF616161),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        Text(
                          'Pagado en Julio 28',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.3400000035762787),
                            fontSize: 12.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            const Text(
              '+ S/ 8,000.00',
              style: TextStyle(
                color: Color(0xFF6DD999),
                fontSize: 14,
                fontFamily: 'Roboto Mono',
                fontWeight: FontWeight.w500,
                letterSpacing: 0.14,
              ),
            )
          ],
        ),
      ),
    );
  }
}
