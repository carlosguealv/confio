import 'package:confio/screens/home_screen/navbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const themeColor = Color(0xff7893FF);
List<Color> cardColors = [
  const Color(0xffD999FF),
  const Color(0xffB9F1EE),
  const Color(0xffFFFBA1)
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.only(
                    left: 20, bottom: 108 + 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Confio",
                          style: GoogleFonts.delaGothicOne(
                              fontSize: 36, color: themeColor),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 25.h,
                            width: 25.w,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "lib/assets/images/notification.png"),
                                    fit: BoxFit.scaleDown)),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 25.h,
                            width: 23.48.w,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "lib/assets/images/Setting.png"),
                                    fit: BoxFit.scaleDown)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      "¡Hola, [Name]! ¿Qué quieres hacer hoy?",
                      style: GoogleFonts.inter(
                          color: Colors.white.withOpacity(0.4)),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: const Color(0xff131313), width: 2),
                        color: const Color(0xff0f0f0f),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: themeColor,
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              alignment: Alignment.center,
                              child: Text(
                                "Cobrar",
                                style: GoogleFonts.inter(
                                    fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              alignment: Alignment.center,
                              child: Text(
                                "Pagar",
                                style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white.withOpacity(0.44)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      height: 46,
                      thickness: 1.7,
                      color: Colors.white10,
                    ),
                    Text(
                      "Calendario",
                      style: GoogleFonts.inter(
                          letterSpacing: 2.9,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.white.withOpacity(0.45)),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const CalendarWidget(),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Vence Pronto",
                      style: GoogleFonts.inter(
                          letterSpacing: 2.9,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.white.withOpacity(0.45)),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 160,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (buildContext, index) {
                            return Center(
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white12,
                                  borderRadius: BorderRadius.circular(9),
                                  border: Border.all(
                                      color: Colors.white12, width: 1),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      cardColors[index % 3],
                                      Colors.grey
                                    ],
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: cardColors[index % 3],
                                            ),
                                            width: 100,
                                            height: 30,
                                          ),
                                          Container(
                                            width: 100,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              child: Container(
                                                height: 39,
                                                width: 39,
                                                decoration: BoxDecoration(
                                                    image: const DecorationImage(
                                                        image: AssetImage(
                                                            "lib/assets/images/demo_pfp.png")),
                                                    shape: BoxShape.circle,
                                                    color: Colors.grey,
                                                    border: Border.all(
                                                        color: Colors.black87,
                                                        width: 2)),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      "Payer 1",
                                      style: GoogleFonts.inter(
                                          color: Colors.white.withOpacity(0.3),
                                          fontSize: 12),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "S/8,000.00",
                                      style: GoogleFonts.ibmPlexMono(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const SizedBox(
                                        width: 120,
                                        child: Divider(
                                          color: Colors.white12,
                                          height: 20,
                                          thickness: 0.9,
                                        )),
                                    Text(
                                      "TODAY",
                                      style: GoogleFonts.ibmPlexMono(
                                          letterSpacing: 2.9,
                                          fontSize: 11,
                                          color:
                                              Colors.white.withOpacity(0.28)),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Más Adelante",
                      style: GoogleFonts.inter(
                          letterSpacing: 2.9,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.white.withOpacity(0.45)),
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (buildContent, index) {
                        return Container(
                          margin: const EdgeInsets.only(top: 22),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 22),
                          decoration: BoxDecoration(
                              color: const Color(0xff0D0E10),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.04),
                                  width: 1)),
                          child: Row(
                            children: [
                              const SizedBox(
                                  height: 51,
                                  width: 51,
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(
                                        "lib/assets/images/demo_pfp.png"),
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Payer 3",
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                          height: 3,
                                          width: 34,
                                          child: LinearProgressIndicator(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            value: 0.35,
                                          )),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "Quedan 6 días",
                                        style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color:
                                                Colors.white.withOpacity(0.35)),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const Spacer(),
                              Text(
                                "S/ 8,000.00",
                                style: GoogleFonts.robotoMono(
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 25.h,
                                  width: 25.w,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "lib/assets/images/grabIcon.png"),
                                          fit: BoxFit.scaleDown)),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
              const Positioned.fill(
                  child:
                      Align(alignment: Alignment.bottomCenter, child: NavBar()))
            ],
          ),
        ),
      ),
    );
  }
}

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 18, bottom: 10),
      decoration: BoxDecoration(
          image: const DecorationImage(
            repeat: ImageRepeat.repeatY,
            image: AssetImage("lib/assets/images/calendar_overlay.png"),
          ),
          color: const Color(0xff2d2d2d),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xff373737), Color(0xff272727)],
          ),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white38, width: 0.5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Próximamente",
              style:
                  GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 22),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Tienes # pagos por cobrar en los próximos 7 días por S/ 64,000.00",
              style: GoogleFonts.inter(color: Colors.white.withOpacity(0.4)),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Divider(
            height: 10,
          ),
          TableCalendar(
            daysOfWeekHeight: 30,
            startingDayOfWeek: StartingDayOfWeek.monday,
            weekendDays: [],
            rowHeight: 33,
            headerStyle: HeaderStyle(
              rightChevronPadding: EdgeInsets.zero,
              formatButtonVisible: false,
              titleTextStyle:
                  GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 16),
              leftChevronVisible: false,
              headerMargin: const EdgeInsets.only(left: 14),
              rightChevronIcon: const Row(
                children: [
                  Icon(
                    Icons.chevron_right,
                    color: themeColor,
                    size: 28,
                  ),
                  SizedBox(
                    width: 110,
                  ),
                  Icon(
                    Icons.chevron_left,
                    color: themeColor,
                    size: 28,
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: themeColor,
                    size: 28,
                  ),
                ],
              ),
            ),
            calendarStyle: const CalendarStyle(
              cellMargin: EdgeInsets.all(2),
              todayTextStyle: TextStyle(fontSize: 14),
              todayDecoration:
                  BoxDecoration(color: themeColor, shape: BoxShape.circle),
              outsideTextStyle: TextStyle(color: Colors.white60),
            ),
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
          )
        ],
      ),
    );
  }
}
