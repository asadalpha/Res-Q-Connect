import 'package:resq_connect/view/userflow/public_side/SOS/sos_screen.dart';
import 'package:resq_connect/view/userflow/public_side/home/homepage.dart';
import 'package:resq_connect/view/profile/profile_page.dart';
import 'package:resq_connect/view/search/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../pages/aboutpage.dart';

class BottomNavBarPublic extends StatefulWidget {
  const BottomNavBarPublic({super.key});

  @override
  State<BottomNavBarPublic> createState() => _BottomNavBarPublicState();
}

class _BottomNavBarPublicState extends State<BottomNavBarPublic> {
  var pageIndex = 0;

  final pages = const [
    HomeScreenPublic(),
    SOSscreen(),
    MapScreen(),
    AboutPageUser(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: Container(
          margin: EdgeInsets.only(left: 13.w, right: 13.w, bottom: 16.h),
          height: 65.h,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromRGBO(110, 109, 109, 1),
                    blurRadius: 20,
                    offset: Offset(0, 10))
              ],
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 0;
                    });
                  },
                  icon: pageIndex == 0
                      ? Image.asset(
                          "assets/icons/home.png",
                          color: Colors.black,
                          height: 35.h,
                        )
                      : Image.asset(
                          "assets/icons/home.png",
                          color: Colors.grey,
                          height: 35.h,
                        )),
              IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 1;
                    });
                  },
                  icon: pageIndex == 1
                      ? Image.asset(
                          "assets/icons/alert.png",
                          color: Colors.black,
                          height: 35.h,
                        )
                      : Image.asset(
                          "assets/icons/alert.png",
                          color: Colors.grey,
                          height: 35.h,
                        )),
              IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 2;
                    });
                  },
                  icon: pageIndex == 2
                      ? Icon(
                          Icons.location_on_outlined,
                          color: Colors.black,
                          size: 35.h,
                        )
                      : Icon(
                          Icons.location_on_outlined,
                          color: Colors.grey,
                          size: 35.h,
                        )),
              IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    setState(() {
                      pageIndex = 3;
                    });
                  },
                  icon: pageIndex == 3
                      ? Image.asset(
                          "assets/icons/account.png",
                          color: Colors.black,
                          height: 35.h,
                        )
                      : Image.asset(
                          "assets/icons/account.png",
                          color: Colors.grey,
                          height: 35.h,
                        )),
            ],
          )),
    );
  }
}
