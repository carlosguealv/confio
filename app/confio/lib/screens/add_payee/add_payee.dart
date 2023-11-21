import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddPayee extends StatefulWidget {
  const AddPayee({super.key});

  @override
  State<AddPayee> createState() => _AddPayeeState();
}

class _AddPayeeState extends State<AddPayee> {
  TextEditingController searchController = TextEditingController();
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
            Container(
              width: 22.w,
              height: 22.h,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("lib/assets/images/notification.png"),
                      fit: BoxFit.scaleDown)),
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
                        image: AssetImage("lib/assets/images/Setting.png"),
                        fit: BoxFit.scaleDown)),
              ),
            ),
          ],
          title: Container(
            width: 117.34.w,
            height: 28.33.h,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("lib/assets/images/logoletters.png"),
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
                                  image: AssetImage(
                                      "lib/assets/images/search.png"),
                                  fit: BoxFit.scaleDown)),
                        ))),
                  ),
                ),
                SizedBox(
                  height: 36.h,
                ),
                Text(
                  'Top People',
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
                //*list view for top people
                SizedBox(
                  width: double.infinity.w,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return const AddPeopleContainer();
                      }),
                ),
                SizedBox(
                  height: 13.h,
                ),
                Text(
                  'Your Contacts',
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
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return const AddPeopleContainer();
                      }),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding:
              EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w, bottom: 20.h),
          child: Container(
            alignment: Alignment.center,
            width: double.infinity.w,
            height: 65.h,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: Colors.white.withOpacity(0.03999999910593033),
                ),
                borderRadius: BorderRadius.circular(11),
              ),
            ),
            child: Text(
              'Add Payee',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontFamily: 'InterSemiBold',
                fontWeight: FontWeight.w600,
                letterSpacing: 0.10,
              ),
            ),
          ),
        ));
  }
}

class AddPeopleContainer extends StatefulWidget {
  const AddPeopleContainer({
    super.key,
  });

  @override
  State<AddPeopleContainer> createState() => _AddPeopleContainerState();
}

class _AddPeopleContainerState extends State<AddPeopleContainer> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 44.w,
                height: 44.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage("https://via.placeholder.com/44x44"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 14.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Eleanor Pena',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.08,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    '@ben+aron',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.47999998927116394),
                      fontSize: 12.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.07,
                    ),
                  )
                ],
              ),
            ],
          ),
          InkWell(
            onTap: () {
              setState(() {
                if (isAdded == true) {
                  isAdded = false;
                } else {
                  isAdded = true;
                }
              });
            },
            child: Container(
                width: 24.w,
                height: 24.w,
                decoration: ShapeDecoration(
                  color: Colors.white.withOpacity(0.07000000029802322),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: Colors.white.withOpacity(0.05999999865889549),
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: isAdded
                    ? const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 13,
                      )
                    : null),
          )
        ],
      ),
    );
  }
}
