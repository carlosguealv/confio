import 'package:confio/screens/components/gap.dart';
import 'package:confio/utils/size_config.dart';
import 'package:confio/widgets/divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? method;
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
              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //*Displays date
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          width: 122.w,
                          height: 41.h,
                          alignment: Alignment.center,
                          decoration: ShapeDecoration(
                            color:
                                Colors.white.withOpacity(0.20999999344348907),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.r)),
                          ),
                          child: Text(
                            'Mon, Jul 10',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontFamily: 'InterMedium',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.14,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 48.h,
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Pago de\n',
                              style: TextStyle(
                                color: Colors.white
                                    .withOpacity(0.6399999856948853),
                                fontSize: 16.sp,
                                fontFamily: 'PoppinsRegular',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: 'Agosto 2023',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontFamily: 'PoppinsMedium',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 27.h,
                      ),
                      Text(
                        'S/ 1,500.00',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.47999998927116394),
                          fontSize: 42.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 33.h,
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
                            onTap: () => {
                              showModalBottomSheet(
                                  showDragHandle: true,
                                  constraints: BoxConstraints(
                                    maxHeight: sx! * 0.4,
                                    maxWidth: sy! * 0.9,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  backgroundColor: const Color(0xff0F1012),
                                  context: context,
                                  builder: (builder) {
                                    return Column(
                                      children: [
                                        Text("Confirma el pago recibido",
                                            style: GoogleFonts.roboto(
                                                color: Colors.white,
                                                fontSize: 14)),
                                        const Gap(
                                          height: 0.025,
                                        ),
                                        Row(
                                          children: [
                                            const Gap(width: 0.05),
                                            _userTile("Payer 1"),
                                            const Gap(width: 0.1),
                                            Image.asset(
                                                "lib/assets/images/Arrow---Right.png"),
                                            const Gap(width: 0.075),
                                            _userTile("Raj Singh"),
                                          ],
                                        ),
                                        const Gap(
                                          height: 0.015,
                                        ),
                                        Row(
                                          children: [
                                            const Gap(width: 0.05),
                                            Container(
                                              width: sy! * 0.8,
                                              height: sx! * 0.05,
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(7.5)),
                                                color: Colors.white10,
                                              ),
                                              child: Row(
                                                children: [
                                                  const Gap(
                                                    width: 0.03,
                                                  ),
                                                  Text(
                                                    "Selecciona método de pago",
                                                    style: GoogleFonts.inter(
                                                        color: Colors.white,
                                                        fontSize: 11),
                                                  ),
                                                  const Gap(
                                                    width: 0.05,
                                                  ),
                                                  PaymentMethods(
                                                    changeMethodCallback:
                                                        (String? newMethod) {
                                                      method = newMethod;
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Gap(
                                          height: 0.015,
                                        ),
                                        Row(
                                          children: [
                                            const Gap(
                                              width: 0.25,
                                            ),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  "Cancelar",
                                                  style: GoogleFonts.inter(
                                                      fontSize: 13,
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              120,
                                                              147,
                                                              255)),
                                                )),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        const Color.fromARGB(
                                                            255, 120, 147, 255),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        60))),
                                                onPressed: () {
                                                  print(method);
                                                },
                                                child: const Text(
                                                    "Marcar como Pagado"))
                                          ],
                                        )
                                      ],
                                    );
                                  })
                            },
                            child: Text(
                              'Confirmar Pago',
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
                      )
                    ],
                  ),
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
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 50.h, bottom: 15.h),
                          child: Container(
                            height: 150.h,
                            width: 150.w,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80"))),
                          ),
                        ),
                        Text(
                          'Payer 1',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontFamily: 'PoppinsMedium',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.72,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          'Categoría: Renta',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.3499999940395355),
                            fontSize: 14.sp,
                            fontFamily: 'PoppinsRegular',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 48.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 61.w, right: 62.w),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircularOptions(
                                  iconName: 'anadir', labelText: 'Añadir Nota'),
                              CircularOptions(
                                iconName: 'gestionar',
                                labelText: 'Gestionar pago',
                              ),
                              CircularOptions(
                                  iconName: 'ignorar',
                                  labelText: 'Ignorar Pago'),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 100.h,
                        ),
                        const CustomDivider(),
                        SizedBox(
                          height: 21.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 25.w, right: 25.w),
                          child: Container(
                            alignment: Alignment.center,
                            width: double.infinity.w,
                            height: 50,
                            decoration: BoxDecoration(
                                color: const Color(0xff0d0e10),
                                borderRadius: BorderRadius.circular(12.r)),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 13.w,
                                ),
                                Container(
                                    width: 30.w,
                                    height: 30.h,
                                    decoration: BoxDecoration(
                                        color: const Color(0xff2A2A2A),
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                "lib/assets/images/dollar.png")),
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        border: Border.all(
                                          width: 0.19.w,
                                          color: Colors.white
                                              .withOpacity(0.10000000149011612),
                                        ))),
                                SizedBox(
                                  width: 16.h,
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Recibiste ',
                                        style: TextStyle(
                                          color: Colors.white
                                              .withOpacity(0.44999998807907104),
                                          fontSize: 13.sp,
                                          fontFamily: 'PoppinsRegular',
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.24,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' S/ 8,000.00 ',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13.sp,
                                          fontFamily: 'PoppinsRegular',
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.24,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' el ',
                                        style: TextStyle(
                                          color: Colors.white
                                              .withOpacity(0.44999998807907104),
                                          fontSize: 13.sp,
                                          fontFamily: 'PoppinsRegular',
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.24,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' 21 de Agosto de 2023',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13.sp,
                                          fontFamily: 'PoppinsRegular',
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.24,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
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

  Widget _userTile(String userName) {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(17)),
          color: Colors.white10,
        ),
        width: sy! * 0.3,
        height: sy! * 0.3,
        child: Column(
          children: [
            const Gap(
              height: 0.03,
            ),
            const CircleAvatar(
              backgroundColor: Colors.white24,
            ),
            const Gap(
              height: 0.02,
            ),
            Text(
              userName,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ));
  }
}

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key, required this.changeMethodCallback});
  final Function(String?) changeMethodCallback;
  @override
  State<PaymentMethods> createState() => PaymentMethodsState();
}

class PaymentMethodsState extends State<PaymentMethods> {
  static List<String> methods = [
    'Seleccionar...',
    'Tarjeta de crédito/débito',
    'Transferencia bancaria',
    'Plataforma de pagos online',
    'Efectivo',
  ];
  String? selectedMethod = methods[0];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sy! * 0.3,
      child: DropdownButton(
          isExpanded: true,
          elevation: 0,
          dropdownColor: const Color(0xff2A2A2A),
          value: selectedMethod,
          items: methods
              .map((method) => DropdownMenuItem(
                  value: method,
                  child: Text(
                    method,
                    style: GoogleFonts.inter(fontSize: 12, color: Colors.white),
                  )))
              .toList(),
          onChanged: (method) => setState(() {
                selectedMethod = method;
                widget.changeMethodCallback(method);
              })),
    );
  }
}

class CircularOptions extends StatelessWidget {
  final String iconName;
  final String labelText;
  const CircularOptions({
    super.key,
    required this.iconName,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 68.17.w,
          height: 68.17.h,
          decoration: BoxDecoration(
              color: const Color(0xFF202227),
              image: DecorationImage(
                  image: AssetImage("lib/assets/images/$iconName.png")),
              shape: BoxShape.circle),
        ),
        SizedBox(
          height: 16.83.h,
        ),
        Text(
          labelText,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 11.72.sp,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        )
      ],
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

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Colors.black.withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
