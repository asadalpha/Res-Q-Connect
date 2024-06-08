import 'package:resq_connect/view/search/map_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../chat/chathomescreen.dart';
import 'aboutpageorg.dart';
import 'homepageorg.dart';

class BottomNavBarOrg extends StatefulWidget {
  const BottomNavBarOrg({super.key});

  @override
  State<BottomNavBarOrg> createState() => _BottomNavBarOrgState();
}

class _BottomNavBarOrgState extends State<BottomNavBarOrg> {
  var pageIndex = 0;

  final pages = [
    const HomePageOrg(),
    const ChatScreen(),
    const MapScreen(),
    const AboutScreen()
  ];

  @override
  Widget build(BuildContext context) {
    const appPrimaryColor = Colors.black;
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: Container(
          margin: EdgeInsets.only(left: 13.w, right: 13.w, bottom: 16.h),
          height: 65.h,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              // boxShadow: const [
              //   BoxShadow(
              //       color: Color.fromRGBO(110, 109, 109, 1),
              //       blurRadius: 20,
              //       offset: Offset(0, 10))
              // ],
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
                          color: appPrimaryColor,
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
                      ? const Icon(
                          Icons.chat_bubble_outline,
                          color: appPrimaryColor,
                          size: 30,
                        )
                      : const Icon(
                          Icons.chat_bubble_outline,
                          color: Colors.grey,
                          size: 30,
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
                          color: appPrimaryColor,
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
                          color: appPrimaryColor,
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
