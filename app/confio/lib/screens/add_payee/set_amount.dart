import 'package:confio/screens/add_payee/set_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SetAmountScreen extends StatefulWidget {
  const SetAmountScreen({super.key});

  @override
  State<SetAmountScreen> createState() => _SetAmountScreenState();
}

class _SetAmountScreenState extends State<SetAmountScreen> {
  String amount = "";
  void updateAmount(String input) {
    setState(() {
      amount = amount + input;
    });
  }

  void backspace() {
    setState(() {
      amount = amount.substring(0, amount.length - 1);
    });
  }

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
                      'S/ $amount',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.47999998927116394),
                        fontSize: 42.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 55.h,
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
                      child: Column(
                        children: [
                          SizedBox(
                            height: 134.h,
                          ),
                          //*circular input buttons
                          Padding(
                            padding: EdgeInsets.only(left: 25.w, right: 25.w),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () => updateAmount("1"),
                                      child: Container(
                                          height: 62.5.h,
                                          width: 62.5.w,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white.withOpacity(
                                                0.09000000357627869),
                                          ),
                                          child: Text(
                                            '1',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17.18.sp,
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )),
                                    ),
                                    InkWell(
                                      onTap: () => updateAmount("2"),
                                      child: Container(
                                          height: 62.5.h,
                                          width: 62.5.w,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white.withOpacity(
                                                0.09000000357627869),
                                          ),
                                          child: Text(
                                            '2',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17.18.sp,
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )),
                                    ),
                                    InkWell(
                                      onTap: () => updateAmount("3"),
                                      child: Container(
                                          height: 62.5.h,
                                          width: 62.5.w,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white.withOpacity(
                                                0.09000000357627869),
                                          ),
                                          child: Text(
                                            '3',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17.18.sp,
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 28.29.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () => updateAmount("4"),
                                      child: Container(
                                          height: 62.5.h,
                                          width: 62.5.w,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white.withOpacity(
                                                0.09000000357627869),
                                          ),
                                          child: Text(
                                            '4',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17.18.sp,
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )),
                                    ),
                                    InkWell(
                                      onTap: () => updateAmount("5"),
                                      child: Container(
                                          height: 62.5.h,
                                          width: 62.5.w,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white.withOpacity(
                                                0.09000000357627869),
                                          ),
                                          child: Text(
                                            '5',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17.18.sp,
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )),
                                    ),
                                    InkWell(
                                      onTap: () => updateAmount("6"),
                                      child: Container(
                                          height: 62.5.h,
                                          width: 62.5.w,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white.withOpacity(
                                                0.09000000357627869),
                                          ),
                                          child: Text(
                                            '6',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17.18.sp,
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 28.29.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () => updateAmount("7"),
                                      child: Container(
                                          height: 62.5.h,
                                          width: 62.5.w,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white.withOpacity(
                                                0.09000000357627869),
                                          ),
                                          child: Text(
                                            '7',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17.18.sp,
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )),
                                    ),
                                    InkWell(
                                      onTap: () => updateAmount("8"),
                                      child: Container(
                                          height: 62.5.h,
                                          width: 62.5.w,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white.withOpacity(
                                                0.09000000357627869),
                                          ),
                                          child: Text(
                                            '8',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17.18.sp,
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )),
                                    ),
                                    InkWell(
                                      onTap: () => updateAmount("9"),
                                      child: Container(
                                          height: 62.5.h,
                                          width: 62.5.w,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white.withOpacity(
                                                0.09000000357627869),
                                          ),
                                          child: Text(
                                            '9',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17.18.sp,
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 28.29.h,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 131.w,
                                    ),
                                    InkWell(
                                      onTap: () => updateAmount("0"),
                                      child: Container(
                                          height: 62.5.h,
                                          width: 62.5.w,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white.withOpacity(
                                                0.09000000357627869),
                                          ),
                                          child: Text(
                                            '0',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17.18.sp,
                                              fontFamily: 'InterRegular',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )),
                                    ),
                                    SizedBox(
                                      width: 80.w,
                                    ),
                                    InkWell(
                                      onTap: () => backspace(),
                                      child: SizedBox(
                                        child: SvgPicture.asset(
                                            "lib/assets/images/backspace.svg"),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 49.h,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return SetPreferenceScreen(
                                  amount: amount,
                                );
                              }));
                            },
                            child: Container(
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
                                "Set Amount",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.08,
                                ),
                              ),
                            ),
                          )
                        ],
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
