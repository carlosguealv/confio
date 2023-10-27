import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confio/logic/blocs/home_screen_bloc/home_screen_bloc.dart';
import 'package:confio/models/overall_payment.dart';
import 'package:confio/models/payment.dart';
import 'package:confio/screens/home_screen/navbar.dart';
import 'package:confio/services/authentication_service.dart';
import 'package:confio/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const themeColor = Color(0xff7893FF);
List<Color> cardColors = [
  const Color(0xffD999FF),
  const Color(0xffB9F1EE),
  const Color(0xffFFFBA1)
];

enum Modes { cobrar, pagar }

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) {
          return HomeBloc();
        },
        child: const HomeLayout());
  }
}

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  Modes mode = Modes.cobrar;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocBuilder<HomeBloc, HomeState>(
            bloc: BlocProvider.of<HomeBloc>(context)..add(PaymentLoad()),
            builder: (context, state) {
              if (state is PaymentsLoading || state is InitialState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return SafeArea(
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
                            "¡Hola, ${authenticationService.currentUser!.email!}! ¿Qué quieres hacer hoy?",
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
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        mode = Modes.cobrar;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: mode == Modes.cobrar
                                            ? themeColor
                                            : Colors.transparent,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 14),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Cobrar",
                                        style: GoogleFonts.inter(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        mode = Modes.pagar;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: mode == Modes.pagar
                                            ? themeColor
                                            : Colors.transparent,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 14),
                                      alignment: Alignment.center,
                                      child: Text("Pagar",
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          )),
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
                          CalendarWidget(
                            mode: mode,
                            paymentsList: [
                              ...((state as PaymentsLoaded)
                                  .first7DaysPayments!),
                              ...((state as PaymentsLoaded).restOfPayments!)
                            ],
                          ),
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
                                // make itemCount be the number of payments in the Next 7 days with "to"
                                // uid equal to the current user's uid if mode is cobrar, and "from" uid equal
                                // to the current user's uid if mode is pagar
                                itemCount: state.first7DaysPayments
                                    .where((element) => mode == Modes.cobrar
                                        ? element.to ==
                                            authenticationService
                                                .currentUser!.uid
                                        : element.from ==
                                            authenticationService
                                                .currentUser!.uid)
                                    .length,
                                itemBuilder: (buildContext, index) {
                                  Payment payment =
                                      state.first7DaysPayments[index];
                                  return Center(
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
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
                                                        BorderRadius.circular(
                                                            5),
                                                    color:
                                                        cardColors[index % 3],
                                                  ),
                                                  width: 100,
                                                  height: 30,
                                                ),
                                                Container(
                                                  width: 100,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10),
                                                    child: Container(
                                                      height: 39,
                                                      width: 39,
                                                      decoration: BoxDecoration(
                                                          image: const DecorationImage(
                                                              image: AssetImage(
                                                                  "lib/assets/images/demo_pfp.png")),
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors.grey,
                                                          border: Border.all(
                                                              color: Colors
                                                                  .black87,
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
                                          FutureBuilder(
                                            future:
                                                firebaseService.getUserByUid(
                                              mode == Modes.cobrar
                                                  ? payment.from
                                                  : payment.to,
                                            ),
                                            builder: (context, snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                return Text(
                                                  "Loading...",
                                                  style: GoogleFonts.inter(
                                                      color: Colors.white
                                                          .withOpacity(0.3),
                                                      fontSize: 12),
                                                );
                                              }
                                              return Expanded(
                                                child: SizedBox(
                                                  width: 100,
                                                  child: Text(
                                                    mode == Modes.cobrar
                                                        ? "${snapshot.data!['email']}"
                                                        : "${snapshot.data!['email']}",
                                                    style: GoogleFonts.inter(
                                                        color: Colors.white
                                                            .withOpacity(0.3),
                                                        fontSize: 12),
                                                    overflow: TextOverflow.clip,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            "${payment.amount}",
                                            style: GoogleFonts.ibmPlexMono(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                            ),
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
                            itemCount: state.restOfPayments
                                .where((element) => mode == Modes.cobrar
                                    ? element.to ==
                                        authenticationService.currentUser!.uid
                                    : element.from ==
                                        authenticationService.currentUser!.uid)
                                .length,
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
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        FutureBuilder(
                                            future: firebaseService
                                                .getUserByUid(mode ==
                                                        Modes.cobrar
                                                    ? state
                                                        .restOfPayments[index]
                                                        .from
                                                    : state
                                                        .restOfPayments[index]
                                                        .to)
                                                .then((value) =>
                                                    value!['email'] as String),
                                            builder: (context, snapshot) {
                                              if (snapshot.connectionState !=
                                                  ConnectionState.done) {
                                                return const Text("");
                                              }
                                              // TODO: Text overflows, fix it
                                              return Text(
                                                snapshot.data!,
                                                softWrap: false,
                                                maxLines: 5,
                                                overflow: TextOverflow.clip,
                                                style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              );
                                            }),
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
                                                value: (DateTime.now()
                                                            .difference(state
                                                                .restOfPayments[
                                                                    index]
                                                                .due
                                                                .toDate())
                                                            .inDays)
                                                        .abs() /
                                                    30,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            SizedBox(
                                              width: 100,
                                              child: Text(
                                                "Quedan ${(DateTime.now().difference(state.restOfPayments[index].due.toDate()).inDays).abs()} días",
                                                style: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: Colors.white
                                                        .withOpacity(0.35)),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    const Spacer(),
                                    Text(
                                      "${state.restOfPayments[index].amount} ${state.restOfPayments[index].currency}",
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
                    Positioned.fill(
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: NavBar(
                              currentIndex: 0,
                            )))
                  ],
                ),
              );
            }),
      ),
    );
  }
}

class MasAdelantePayment extends StatelessWidget {
  const MasAdelantePayment({super.key, required this.amount});
  final double amount;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class VenceProntoPayment extends StatelessWidget {
  const VenceProntoPayment({super.key, required this.amount});
  final double amount;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class CalendarWidget extends StatefulWidget {
  const CalendarWidget(
      {Key? key, required this.mode, this.paymentsList = const []})
      : super(key: key);
  final Modes? mode;
  final List<Payment> paymentsList;

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

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
              "Tienes # pagos por ${widget.mode == Modes.cobrar ? "cobrar" : "pagar"} en los próximos 7 días por S/ 64,000.00",
              style: GoogleFonts.inter(color: Colors.white.withOpacity(0.4)),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Divider(
            height: 10,
          ),
          TableCalendar(
            locale: 'es_ES',
            eventLoader: (day) {
              return (widget.paymentsList.any(
                (payment) => DateUtils.isSameDay(day, payment.due.toDate()),
              )
                  ? [1]
                  : []);
            },
            daysOfWeekHeight: 30,
            startingDayOfWeek: StartingDayOfWeek.monday,
            weekendDays: const [],
            rowHeight: 33,
            headerStyle: HeaderStyle(
              rightChevronPadding: EdgeInsets.zero,
              formatButtonVisible: false,
              titleTextStyle:
                  GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 16),
              headerMargin: const EdgeInsets.only(left: 14),
              leftChevronIcon: const Icon(
                Icons.chevron_left,
                color: themeColor,
                size: 28,
              ),
              rightChevronIcon: const Icon(
                Icons.chevron_right,
                color: themeColor,
                size: 28,
              ),
            ),
            calendarStyle: const CalendarStyle(
              markerDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              cellMargin: EdgeInsets.all(2),
              todayTextStyle: TextStyle(fontSize: 14),
              todayDecoration:
                  BoxDecoration(color: themeColor, shape: BoxShape.circle),
              outsideTextStyle: TextStyle(color: Colors.white60),
            ),
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay; // update `_focusedDay` here as well
              });
            },
          )
        ],
      ),
    );
  }
}
