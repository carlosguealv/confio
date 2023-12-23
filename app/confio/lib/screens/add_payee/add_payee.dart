import 'package:confio/models/confio_user.dart';
import 'package:confio/services/authentication_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddPayee extends StatefulWidget {
  const AddPayee({super.key});

  @override
  State<AddPayee> createState() => _AddPayeeState();
}

class _AddPayeeState extends State<AddPayee> {
  TextEditingController searchController = TextEditingController();
  final _addedPersonChangeNotifier = AddedPersonChangeNotifier();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Cambiar preferencias'),
                    content: const Text(
                        '¿Seguro que quieres cambiar las preferencias de las notificaciones?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancelar'),
                      ),
                      FutureBuilder(
                          future: (authenticationService.firebaseMessaging
                              .requestPermission()),
                          builder: (context, snapshot) {
                            return TextButton(
                              onPressed: () {
                                if (snapshot.data!.authorizationStatus !=
                                    AuthorizationStatus.authorized) {
                                  authenticationService.createAndUploadToken();
                                }
                                authenticationService.firebaseMessaging
                                    .deleteToken();
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cambiar preferencias'),
                            );
                          }),
                    ],
                  );
                },
              );
            },
            child: Container(
              width: 22.w,
              height: 22.h,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/notification.png"),
                      fit: BoxFit.scaleDown)),
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Container(
              width: 22.34.w,
              height: 22.h,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/Setting.png"),
                      fit: BoxFit.scaleDown)),
            ),
          ),
        ],
        title: Container(
          width: 117.34.w,
          height: 28.33.h,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/logoletters.png"),
                  fit: BoxFit.scaleDown)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 45.h,
              ),
              Container(
                width: double.infinity,
                height: 51.h,
                decoration: ShapeDecoration(
                  color: Colors.white.withOpacity(0.09000000357627869),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: Colors.white.withOpacity(0.05000000074505806),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: TextField(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontFamily: 'InterMedium',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.07,
                  ),
                  controller: searchController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Name, @username, email, phone',
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.23999999463558197),
                        fontSize: 12.sp,
                        fontFamily: 'InterMedium',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.07,
                      ),
                      contentPadding: EdgeInsets.only(left: 15.w, top: 13.h),
                      suffixIcon: InkWell(
                          child: Container(
                        height: 14.h,
                        width: 14.h,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/search.png"),
                                fit: BoxFit.scaleDown)),
                      ))),
                ),
              ),
              SizedBox(
                height: 36.h,
              ),
              Text(
                'Your payers',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.44999998807907104),
                  fontSize: 14,
                  fontFamily: 'RobotoMono',
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.90,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              SizedBox(
                width: double.infinity.w,
                child: FutureBuilder<ConfioUser?>(
                    future: authenticationService.currentConfioUser,
                    builder: (context, snapshot) {
                      print(snapshot);
                      if (snapshot.hasData) {
                        return AddPeopleContainer(
                          people: snapshot.data!.payers,
                          addedPersonChangeNotifier: _addedPersonChangeNotifier,
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }),
              ),
              Text(
                'Your payees',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.44999998807907104),
                  fontSize: 14,
                  fontFamily: 'RobotoMono',
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.90,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              SizedBox(
                width: double.infinity.w,
                child: FutureBuilder<ConfioUser?>(
                    future: authenticationService.currentConfioUser,
                    builder: (context, snapshot) {
                      print(snapshot);
                      if (snapshot.hasData) {
                        return AddPeopleContainer(
                          people: snapshot.data!.payees,
                          addedPersonChangeNotifier: _addedPersonChangeNotifier,
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Stack(
        children: [
          Padding(
              padding: const EdgeInsets.only(bottom: 30, left: 100),
              child: InkWell(
                onTap: () {},
                child: Text(
                  'Add Payee',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontFamily: 'PoppinsBold',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )),
          Padding(
              padding: const EdgeInsets.only(left: 250),
              child: InkWell(
                onTap: () {},
                child: Text(
                  'Add Payer',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontFamily: 'PoppinsBold',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class AddPeopleContainer extends StatefulWidget {
  final List<String?> people;
  final AddedPersonChangeNotifier addedPersonChangeNotifier;

  const AddPeopleContainer({
    super.key,
    required this.people,
    required this.addedPersonChangeNotifier,
  });

  @override
  State<AddPeopleContainer> createState() => _AddPeopleContainerState();
}

class _AddPeopleContainerState extends State<AddPeopleContainer> {
  @override
  Widget build(BuildContext context) {
    print(widget.people);
    return Padding(
      padding: EdgeInsets.only(bottom: 30.h),
      child: SizedBox(
        width: 100.w,
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.people.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Container(
                    width: 44.w,
                    height: 44.h,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image:
                            NetworkImage("https://via.placeholder.com/44x44"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 14.w,
                  ),
                  Text(
                    widget.people[index]!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.08,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        widget.addedPersonChangeNotifier
                            .changePerson(widget.people[index] ?? '');
                      });
                    },
                    child: ListenableBuilder(
                      listenable: widget.addedPersonChangeNotifier,
                      builder: (context, child) {
                        return Container(
                            width: 24.w,
                            height: 24.w,
                            decoration: ShapeDecoration(
                              color:
                                  Colors.white.withOpacity(0.07000000029802322),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  color: Colors.white
                                      .withOpacity(0.05999999865889549),
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            child: widget.addedPersonChangeNotifier.person ==
                                    widget.people[index]
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 13,
                                  )
                                : null);
                      },
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}

class AddScreenCustomPainter extends CustomPainter {
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
    paint0Fill.color = Colors.green;
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class AddedPersonChangeNotifier with ChangeNotifier {
  String? _person;
  String? get person => _person;

  void changePerson(String person) {
    _person = person;
    notifyListeners();
  }
}
