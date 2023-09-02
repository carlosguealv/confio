import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        height: 932.h,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xff3550DA),
              Color(0xff4C62DF),
              Color(0xff6B7BE8),
              Color(0xffB1B9F3),
            ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 82.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 48.0.w),
              child: Row(
                children: [
                  Container(
                    height: 100.h,
                    width: 107.w,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(30.r),
                        image: DecorationImage(
                            image: AssetImage("assets/images/profile.png"),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: 60.w,
                  ),
                  profileInfoText(
                    name: 'Deudas',
                    value: 10.toString(),
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  profileInfoText(
                    name: 'Cobrando',
                    value: 8.toString(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 29.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0.w),
              child: SizedBox(
                width: 142.w,
                height: 36.h,
                child: Text(
                  'Nombre',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23.sp,
                    fontFamily: 'PoppinsSemiBold',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 43.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 60.w, right: 60.w),
              child: Column(
                children: [
                  profileOptionsWidget(
                      name: 'Historial de transacciones', onTap: () {}),
                  profileOptionsWidget(
                      name: 'Información de cuenta', onTap: () {}),
                  profileOptionsWidget(name: 'Login y seguridad', onTap: () {}),
                  profileOptionsWidget(name: 'Data y privacidad', onTap: () {}),
                  profileOptionsWidget(name: 'Ayuda', onTap: () {}),
                  profileOptionsWidget(
                      name: 'Salir de la cuenta', onTap: () {}),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class profileOptionsWidget extends StatelessWidget {
  final String name;
  final VoidCallback onTap;
  const profileOptionsWidget({
    super.key,
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 35.h),
      child: InkWell(
          onTap: onTap,
          child: SizedBox(
            width: 268.w,
            height: 23.h,
            child: Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 13.sp,
                fontFamily: 'PoppinsSemiBold',
                fontWeight: FontWeight.w600,
              ),
            ),
          )),
    );
  }
}

class profileInfoText extends StatelessWidget {
  final String value;
  final String name;
  const profileInfoText({
    super.key,
    required this.value,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'PoppinsSemiBold',
              fontWeight: FontWeight.w600,
              fontSize: 35.sp),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12.sp,
            fontFamily: 'PoppinsSemiBold',
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
