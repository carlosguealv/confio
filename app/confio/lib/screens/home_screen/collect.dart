
import 'package:confio/screens/home_screen/widget/collectTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

class CollectScreen extends StatefulWidget {
  const CollectScreen({super.key});

  @override
  State<CollectScreen> createState() => _CollectScreenState();
}

class _CollectScreenState extends State<CollectScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  TextEditingController venceProntoController = TextEditingController();
  TextEditingController vendraLuegoController = TextEditingController();
  DateTime today = DateTime.now();
  DateTime? _selectedDay = DateTime.now();
  
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    venceProntoController.dispose();
    vendraLuegoController.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 60.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 89.w,
                  ),
                  Container(
                    height: 38.h,
                    width: 263.w,
                    decoration: BoxDecoration(
                        color: const Color(0xff8A98DA),
                        borderRadius: BorderRadius.circular(30.r)),
                    child: TabBar(
                        indicator: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        controller: _tabController,
                        tabs: [
                          Text(
                            "PAGAR",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontFamily: 'RobotoBold',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "COBRAR",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontFamily: 'RobotoBold',
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ]),
                  ),
                  SizedBox(
                    width: 14.w,
                  ),
                  Container(
                    height: 37.h,
                    width: 38.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: Colors.white),
                    child: const Icon(Icons.notifications_active),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),

              //calender

              Padding(
                padding: EdgeInsets.only(left: 32.w, right: 27.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TableCalendar(
                      rowHeight: 40,
                      daysOfWeekStyle: DaysOfWeekStyle(
                          weekdayStyle: TextStyle(color: Colors.white),
                          weekendStyle: TextStyle(color: Colors.white)),
                      calendarStyle: const CalendarStyle(
                          todayDecoration: BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.circle),
                          selectedDecoration: BoxDecoration(
                              color: Color(0xffB4A5FF), shape: BoxShape.circle),
                          outsideDaysVisible: false,
                          holidayTextStyle: TextStyle(color: Colors.white),
                          weekendTextStyle: TextStyle(color: Colors.white),
                          defaultTextStyle: TextStyle(color: Colors.white)),
                      headerStyle: HeaderStyle(
                          leftChevronIcon: const Icon(
                            Icons.chevron_left,
                            color: Colors.white,
                          ),
                          rightChevronIcon: const Icon(
                            Icons.chevron_right,
                            color: Colors.white,
                          ),
                          formatButtonVisible: false,
                          titleCentered: true,
                          titleTextStyle: TextStyle(
                              fontSize: 20.sp,
                              fontFamily: 'RobotoSemiBold',
                              color: Colors.white,
                              fontWeight: FontWeight.w400)),
                      focusedDay: today,
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2050, 3, 14),
                      selectedDayPredicate: (day) {
                        return isSameDay(_selectedDay, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        if (!isSameDay(_selectedDay, selectedDay)) {
                          // Call `setState()` when updating the selected day
                          setState(() {
                            _selectedDay = selectedDay;
                            today = focusedDay;
                          });
                        }
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CollectTextField(
                        controller: venceProntoController,
                        labelText: 'VENCE PRONTO:'),
                    SizedBox(
                      height: 22.h,
                    ),
                    CollectTextField(
                        controller: vendraLuegoController,
                        labelText: 'VENDRÁ LUEGO:'),
                    SizedBox(
                      height: 150.h,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
