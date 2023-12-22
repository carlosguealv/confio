import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AddPayment extends StatefulWidget {
  final String amount;
  const AddPayment({super.key, required this.amount});

  @override
  State<AddPayment> createState() => _AddPaymentState();
}

class _AddPaymentState extends State<AddPayment> {
  //index 0 for google
  //index 1 for apply pay
  //index 2 for cash
  //index 3 for bank

  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(tileMode: TileMode.decal, colors: [
            Color(0xff626BC0),
            Color(0xff7757B3),
            Color(0xff935fca),
            Color(0xffB962EC),
          ])),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //*Displays avartar
                    Container(
                      height: 69.h,
                      width: 69.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(width: 2.27.w, color: Colors.white),
                          image: const DecorationImage(
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1682688759350-050208b1211c?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"))),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Robert N Fox\n',
                            style: TextStyle(
                              color:
                                  Colors.white.withOpacity(0.8399999737739563),
                              fontSize: 17,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: '@rebrto_92.fire',
                            style: TextStyle(
                              color:
                                  Colors.white.withOpacity(0.6000000238418579),
                              fontSize: 15,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.51,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    //*displays amount
                    Text(
                      'S/ ${widget.amount}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 42.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 29.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 40.h),
                      child: Container(
                        width: 128.w,
                        height: 37.h,
                        alignment: Alignment.center,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 0.50, color: Colors.white),
                            borderRadius: BorderRadius.circular(18.50),
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Editar monto',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontFamily: 'PoppinsRegular',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CustomPaint(
                  size: Size(
                      MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height -
                          300.h), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: RPSCustomPainter(),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 300.h,
                    child: Padding(
                      padding: EdgeInsets.only(left: 28.w, right: 28.w),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 50.h,
                            ),
                            Text(
                              'Set Payment Methods',
                              style: TextStyle(
                                color: Colors.white
                                    .withOpacity(0.44999998807907104),
                                fontSize: 14,
                                fontFamily: 'Roboto Mono',
                                fontWeight: FontWeight.w700,
                                height: 0.14,
                                letterSpacing: 0.90,
                              ),
                            ),
                            SizedBox(
                              height: 31.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      index = 0;
                                    });
                                  },
                                  child: Container(
                                    height: 88.h,
                                    width: 170.w,
                                    decoration: BoxDecoration(
                                        color: const Color(0xff0D0D0D),
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        border: Border.all(
                                            width: 1.w,
                                            color: const Color(0xff262626))),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 14.h, left: 17.w, right: 17.w),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Container(
                                              height: 15.h,
                                              width: 15.w,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color:
                                                      const Color(0xff0e0e0e),
                                                  border: Border.all(
                                                      width: 2.w,
                                                      color: Colors.white)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(1.8),
                                                child: Container(
                                                  height: 8.h,
                                                  width: 8.w,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: (index == 0)
                                                          ? Colors.white
                                                          : null),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 37.h,
                                            width: 90.w,
                                            child: SvgPicture.asset(
                                                "assets/images/googlepay.svg"),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      index = 1;
                                    });
                                  },
                                  child: Container(
                                    height: 88.h,
                                    width: 170.w,
                                    decoration: BoxDecoration(
                                        color: const Color(0xff0D0D0D),
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        border: Border.all(
                                            width: 1.w,
                                            color: const Color(0xff262626))),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 14.h, left: 17.w, right: 17.w),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Container(
                                              height: 15.h,
                                              width: 15.w,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color:
                                                      const Color(0xff0e0e0e),
                                                  border: Border.all(
                                                      width: 2.w,
                                                      color: Colors.white)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(1.8),
                                                child: Container(
                                                  height: 8.h,
                                                  width: 8.w,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: (index == 1)
                                                          ? Colors.white
                                                          : null),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 37.h,
                                            width: 90.w,
                                            child: SvgPicture.asset(
                                                "assets/images/applepay.svg"),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 13.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      index = 2;
                                    });
                                  },
                                  child: Container(
                                    height: 88.h,
                                    width: 170.w,
                                    decoration: BoxDecoration(
                                        color: const Color(0xff0D0D0D),
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        border: Border.all(
                                            width: 1.w,
                                            color: const Color(0xff262626))),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 14.h, left: 17.w, right: 17.w),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Container(
                                              height: 15.h,
                                              width: 15.w,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color:
                                                      const Color(0xff0e0e0e),
                                                  border: Border.all(
                                                      width: 2.w,
                                                      color: Colors.white)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(1.8),
                                                child: Container(
                                                  height: 8.h,
                                                  width: 8.w,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: (index == 2)
                                                          ? Colors.white
                                                          : null),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 37.h,
                                            width: 90.w,
                                            child: SvgPicture.asset(
                                                "assets/images/cash.svg"),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      index = 3;
                                    });
                                  },
                                  child: Container(
                                    height: 88.h,
                                    width: 170.w,
                                    decoration: BoxDecoration(
                                        color: const Color(0xff0D0D0D),
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        border: Border.all(
                                            width: 1.w,
                                            color: const Color(0xff262626))),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 14.h, left: 17.w, right: 17.w),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Container(
                                              height: 15.h,
                                              width: 15.w,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color:
                                                      const Color(0xff0e0e0e),
                                                  border: Border.all(
                                                      width: 2.w,
                                                      color: Colors.white)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(1.8),
                                                child: Container(
                                                  height: 8.h,
                                                  width: 8.w,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: (index == 3)
                                                          ? Colors.white
                                                          : null),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 37.h,
                                            width: 90.w,
                                            child: SvgPicture.asset(
                                                "assets/images/bank.svg"),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 206.h,
                            ),
                            Container(
                              width: 373.w,
                              height: 65.h,
                              alignment: Alignment.center,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1.w,
                                    color: Colors.white
                                        .withOpacity(0.03999999910593033),
                                  ),
                                  borderRadius: BorderRadius.circular(11),
                                ),
                              ),
                              child: Text(
                                "Set Preference",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.08,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.3211098, size.height * 0.001222029);
    path_0.lineTo(0, 0);
    path_0.lineTo(0, size.height * 2.587258);
    path_0.lineTo(size.width, size.height * 2.587258);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width * 0.6920304, size.height * 0.001210945);
    path_0.cubicTo(
        size.width * 0.6719322,
        size.height * 0.001289972,
        size.width * 0.6525818,
        size.height * 0.005744875,
        size.width * 0.6376636,
        size.height * 0.01372850);
    path_0.cubicTo(
        size.width * 0.6084579,
        size.height * 0.02935734,
        size.width * 0.5705093,
        size.height * 0.03800873,
        size.width * 0.5311636,
        size.height * 0.03800873);
    path_0.lineTo(size.width * 0.4686121, size.height * 0.03800873);
    path_0.cubicTo(
        size.width * 0.4318972,
        size.height * 0.03800873,
        size.width * 0.3967220,
        size.height * 0.02926260,
        size.width * 0.3709907,
        size.height * 0.01373596);
    path_0.cubicTo(
        size.width * 0.3578341,
        size.height * 0.005797008,
        size.width * 0.3398832,
        size.height * 0.001293472,
        size.width * 0.3211098,
        size.height * 0.001222029);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.black.withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
