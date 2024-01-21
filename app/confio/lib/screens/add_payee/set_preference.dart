import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confio/models/confio_user.dart';
import 'package:confio/screens/add_payee/add_payment.dart';
import 'package:confio/services/authentication_service.dart';
import 'package:confio/services/firebase_service.dart';
import 'package:confio/services/storage_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

const TextStyle kTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 12,
  fontFamily: 'Inter',
  fontWeight: FontWeight.w500,
);

class SetPreferenceScreen extends StatefulWidget {
  final String amount;
  final String payerId;
  final String payeeId;
  final String selectedEmail;

  const SetPreferenceScreen(
      {super.key,
      required this.amount,
      required this.payerId,
      required this.payeeId,
      required this.selectedEmail});

  @override
  State<SetPreferenceScreen> createState() => _SetPreferenceScreenState();
}

class _SetPreferenceScreenState extends State<SetPreferenceScreen> {
//*document will be stored to this variable
  File? file;
  int selectedFrequency = 0;
  List<String> frequencySelectionOptions = ["Weekly", "Monthly", "Yearly"];

  DateTime? startingDate;
  DateTime? endingDate;

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
                    //*Displays avatar
                    FutureBuilder(
                      future:
                          firebaseService.getUserByEmail(widget.selectedEmail),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return FutureBuilder(
                            future: storageService.getProfilePic(
                                ConfioUser.fromDocument(
                                    snapshot.data as DocumentSnapshot)),
                            builder: (context, snapshot1) {
                              if (snapshot1.hasData) {
                                return CircleAvatar(
                                  radius: 50.r,
                                  backgroundImage: MemoryImage(snapshot1.data!),
                                );
                              } else {
                                return CircleAvatar(
                                  radius: 50.r,
                                  backgroundImage: const AssetImage(
                                      "assets/images/blankuser.png"),
                                );
                              }
                            },
                          );
                        } else {
                          return CircleAvatar(
                            radius: 50.r,
                            backgroundImage:
                                const AssetImage("assets/images/blankuser.png"),
                          );
                        }
                      },
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: widget.selectedEmail,
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
                          onTap: () {
                            Navigator.pop(context);
                          },
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
                          children: [
                            //*circular input buttons
                            SizedBox(
                              height: 50.h,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(11.r),
                                  border: Border.all(
                                      width: 1, color: const Color(0xff181818)),
                                  color: const Color(0xff0f0f0f)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 29.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 20.w, right: 20.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Categoría",
                                          style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.25),
                                            fontSize: 12.sp,
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const Text(
                                          'Renta',
                                          textAlign: TextAlign.right,
                                          style: kTextStyle,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 27.h,
                                  ),
                                  Container(
                                    height: 1.h,
                                    width: double.infinity,
                                    color: const Color(0xff181818),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 20.w, right: 20.w),
                                    child: SizedBox(
                                      width: 200.h,
                                      child: TextField(
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                          fontFamily: 'InterRegulars',
                                          fontWeight: FontWeight.w500,
                                        ),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Añadir nota (opcional)',
                                          hintStyle: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.25),
                                            fontSize: 12.sp,
                                            fontFamily: 'InterRegular',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 19.h,
                            ),
                            Container(
                              height: 189.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(11.r),
                                  border: Border.all(
                                      width: 1, color: const Color(0xff181818)),
                                  color: const Color(0xff0f0f0f)),
                              child: Column(
                                children: [
                                  Expanded(
                                      child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedFrequency++;
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                        const Text(
                                          'Frecuencia',
                                          style: kTextStyle,
                                        ),
                                        const Spacer(),
                                        Text(
                                          frequencySelectionOptions[
                                              selectedFrequency % 3],
                                          style: kTextStyle,
                                        ),
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                      ],
                                    ),
                                  )),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                        const Text(
                                          'Starting Date',
                                          style: kTextStyle,
                                        ),
                                        const Spacer(),
                                        TextButton(
                                          onPressed: () async {
                                            final DateTime? pickedDate =
                                                await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(2000),
                                              lastDate: DateTime(2100),
                                            );
                                            if (pickedDate != null) {
                                              // Update the state with the selected date
                                              setState(() {
                                                if (endingDate != null &&
                                                    (pickedDate.isAfter(
                                                            endingDate!) ||
                                                        pickedDate
                                                            .isAtSameMomentAs(
                                                                endingDate!))) {
                                                  endingDate = null;
                                                } else if (!(pickedDate
                                                        .isBefore(
                                                            DateTime.now()) ||
                                                    pickedDate.difference(
                                                          DateTime.now(),
                                                        ) <
                                                        const Duration(
                                                          days: 1,
                                                        ))) {
                                                  startingDate = pickedDate;
                                                } else {
                                                  startingDate = null;
                                                }
                                              });
                                            }
                                          },
                                          child: Text(
                                            startingDate == null
                                                ? 'Select Date'
                                                : ('${startingDate!.day}/${startingDate!.month}/${startingDate!.year}'),
                                            style: kTextStyle,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                        const Text(
                                          'Ending Date',
                                          style: kTextStyle,
                                        ),
                                        const Spacer(),
                                        TextButton(
                                          onPressed: () async {
                                            final DateTime? pickedDate =
                                                await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(2000),
                                              lastDate: DateTime(2100),
                                            );
                                            if (pickedDate != null) {
                                              // Update the state with the selected date
                                              setState(() {
                                                if (startingDate != null &&
                                                    (pickedDate.isBefore(
                                                            startingDate!) ||
                                                        pickedDate
                                                            .isAtSameMomentAs(
                                                                startingDate!))) {
                                                  startingDate = null;
                                                }
                                                endingDate = pickedDate;
                                              });
                                            }
                                          },
                                          child: Text(
                                            endingDate == null
                                                ? 'Select Date'
                                                : ('${endingDate!.day}/${endingDate!.month}/${endingDate!.year}'),
                                            style: kTextStyle,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 19.h,
                            ),
                            InkWell(
                              onTap: () async {
                                FilePickerResult? result =
                                    await FilePicker.platform.pickFiles();

                                if (result != null) {
                                  file = File(result.files.single.path!);
                                } else {
                                  // User canceled the picker
                                }
                              },
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11.r),
                                    border: Border.all(
                                        width: 1,
                                        color: const Color(0xff181818)),
                                    color: const Color(0xff0f0f0f)),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 20.w,
                                      right: 20.w,
                                      top: 25,
                                      bottom: 25.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Upload Document (optional)',
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.25),
                                          fontSize: 12.sp,
                                          fontFamily: 'InterRegular',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 18.h,
                                        width: 18.w,
                                        child: SvgPicture.asset(
                                            "assets/images/uploadIcon.svg",
                                            fit: BoxFit.scaleDown),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 36.h,
                            ),

                            InkWell(
                              onTap: () {
                                if (startingDate == null ||
                                    endingDate == null) {
                                  return;
                                }
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    Recurrences recurrence;
                                    switch (selectedFrequency) {
                                      case 0:
                                        recurrence = Recurrences.weekly;
                                        break;
                                      case 1:
                                        recurrence = Recurrences.monthly;
                                        break;
                                      case 2:
                                        recurrence = Recurrences.yearly;
                                        break;
                                      default:
                                        recurrence = Recurrences.weekly;
                                        break;
                                    }
                                    return AddPayment(
                                      amount: widget.amount,
                                      payeeId: widget.payeeId,
                                      payerId: widget.payerId,
                                      selectedEmail: widget.selectedEmail,
                                      startDate:
                                          Timestamp.fromDate(startingDate!),
                                      endDate: Timestamp.fromDate(endingDate!),
                                      recurrence: recurrence,
                                    );
                                  },
                                ));
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
