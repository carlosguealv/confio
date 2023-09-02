import 'package:confio/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:confio/screens/home_screen/profilescreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> with SingleTickerProviderStateMixin {
  Color primaryColor = Color(0xff948DFF);
  int currentindex = 0;
  List<Widget> screens = const [
   HomeScreen(),
   Text("Select"),
   ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        extendBody: true,
        bottomNavigationBar: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 140.h,
                width: double.infinity.w,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "lib/assets/images/navbarheader.png",
                        ),
                        fit: BoxFit.fitWidth)),
                child: Stack(
                  children: [
                    Positioned(
                        top: 0,
                        child: Container(
                          height: 40.h,
                          width: 428.w,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    "lib/assets/images/navbarcurve.png",
                                  ),
                                  fit: BoxFit.fill)),
                        )),
                    Positioned(
                        top: 50,
                        left: 50,
                        child: navbarItem(
                            assetname: "inicio",
                            labelText: "Inicio",
                            index: 0)),
                    Positioned(
                      top: 20,
                      left: 175,
                      child: navbarItemCircle(index: 1),
                    ),
                    Positioned(
                        top: 50,
                        right: 50,
                        child: navbarItem(
                            assetname: "perfil",
                            labelText: "Perfil",
                            index: 2)),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: screens[currentindex]);
  }

  Widget navbarItemCircle({required int index}) {
    return InkWell(
      onTap: () {
        setState(() {
          currentindex = index;
        });
      },
      child: Container(
        width: 59.w,
        height: 57.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2.43.w, color: Color(0xff575757))),
      child: Icon(Icons.add, color: (currentindex==index) ? Color(0xff7893FF) : Colors.white,),
      ),
    );
  }

  Widget navbarItem(
      {required String assetname,
      required String labelText,
      required int index}) {
    return InkWell(
      onTap: () {
        setState(() {
          currentindex = index;
        });
      },
      child: Column(
        children: [
          SvgPicture.asset(
            "lib/assets/images/$assetname.svg",
            color: (currentindex == index)
                ? const Color(0xff7893FF)
                : const Color(0xff575757),
          ),
          SizedBox(
            height: 11.h,
          ),
          Text(
            labelText,
            style: TextStyle(
              color: (currentindex == index)
                  ? Color(0xff7893FF)
                  : Color(0xff575757),
              fontSize: 12,
              fontFamily: 'InterMedium',
              fontWeight: FontWeight.w500,
              letterSpacing: 1.02,
            ),
          )
        ],
      ),
    );
  }
}
