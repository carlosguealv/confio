import 'package:confio/screens/home_screen/collect.dart';
import 'package:flutter/material.dart';
import 'package:confio/screens/home_screen/profilescreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this)
      ..addListener(() {
        setState(() {
          switch (_tabController.index) {
            case 0:
              index = 0;
            case 1:
              index = 1;
            case 2:
              index = 2;
          }
        });
      });
    super.initState();
  }

  int index = 0;
  List<Widget> screens = [
    const CollectScreen(),
    const Text("Anadir"),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r)),
              color: const Color(0xffD9D9D9)),
          height: 60.h,
          child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                  color: Colors.white,
                  borderRadius: index == 0
                      ? BorderRadius.only(
                          topLeft: Radius.circular(50.r),
                          topRight: Radius.circular(50.r),
                          bottomRight: Radius.circular(50.r))
                      : index == 2
                          ? BorderRadius.only(
                              topLeft: Radius.circular(50.r),
                              topRight: Radius.circular(50.r),
                              bottomLeft: Radius.circular(50.r))
                          : BorderRadius.circular(50.r)),
              tabs: [
                Text(
                  "Home",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'RobotoRegular',
                      fontWeight: FontWeight.w600,
                      fontSize: 17.sp),
                ),
                Text("AÑADIR",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'RobotoRegular',
                        fontWeight: FontWeight.w600,
                        fontSize: 17.sp)),
                Text("PERFIL",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'RobotoRegular',
                        fontWeight: FontWeight.w600,
                        fontSize: 17.sp)),
              ]),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: screens,
        ));
  }
}
