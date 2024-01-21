import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confio/models/payment.dart';
import 'package:confio/screens/components/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TusPagosWidget extends StatefulWidget {
  final Timestamp payment;
  final double amount;
  const TusPagosWidget(
      {super.key, required this.payment, required this.amount});

  @override
  State<TusPagosWidget> createState() => _TusPagosWidgetState();
}

class _TusPagosWidgetState extends State<TusPagosWidget> {
  String _generateString(Timestamp timestamp) {
    DateTime date = timestamp.toDate();
    String s = date.day.toString() +
        '/' +
        date.month.toString() +
        '/' +
        date.year.toString();

    return s;
  }

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
                  width: 30,
                  height: 30,
                  decoration: ShapeDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/images/bill.png'),
                    ),
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
                    SizedBox(
                      height: 14.h,
                    ),
                    Text(
                      '${_generateString(widget.payment)}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              'S/ ${widget.amount}',
              style: const TextStyle(
                color: Colors.red,
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
