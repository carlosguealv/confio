import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> with SingleTickerProviderStateMixin {
  Color primaryColor = Color(0xff948DFF);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 108,
      width: double.infinity.w,
      decoration: const BoxDecoration(
        color: Colors.transparent,
          image: DecorationImage(
              image: AssetImage(
                "lib/assets/images/navbarheader.png",
              ),
              fit: BoxFit.fitWidth)
      ),
      child: Stack(
        children: [
          Positioned(
              top: 0,
              child: Container(
                height: 40.h,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "lib/assets/images/navbarcurve.png",
                        ),
                        fit: BoxFit.fill)),
              )
          ),
          Positioned(
              top: 50,
              left: 50,
              child: navbarItem(
                  assetname: "inicio",
                  labelText: "Inicio",
                  index: 0
              )
          ),
          Positioned(
            top: 20,
            left: MediaQuery.sizeOf(context).width/2 - 50/2,
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
    );
  }

  Widget navbarItemCircle({required int index}) {
    return InkWell(
      onTap: () {
        setState(() {
        });
      },
      child: Container(
        width: 59.w,
        height: 57.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2.43.w, color: Color(0xff575757))),
        child: Icon(Icons.add, color: (0 == index) ? Color(0xff7893FF) : Colors.white,),
      ),
    );
  }

  Widget navbarItem({required String assetname, required String labelText, required int index}) {
    return InkWell(
      onTap: () {
        setState(() {
        });
      },
      child: Column(
        children: [
          SvgPicture.asset(
            "lib/assets/images/$assetname.svg",
            color: (0 == index) ? const Color(0xff7893FF) : const Color(0xff575757),
          ),
          SizedBox(
            height: 11.h,
          ),
          Text(
            labelText,
            style: TextStyle(
              color: (0 == index) ? Color(0xff7893FF) : Color(0xff575757),
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
