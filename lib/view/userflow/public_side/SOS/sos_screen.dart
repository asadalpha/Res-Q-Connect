import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../users/disaster_info_page.dart';

class SOSscreen extends StatelessWidget {
  const SOSscreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool abc = false;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 39.h,
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back_ios_new_rounded)),
          SizedBox(
            height: 15.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Are you in emergency?",
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 25.h),
              height: 55.h,
              width: 236.w,
              child: Text(
                "Press the below button and help  will reach you soon",
                maxLines: 4,
                // overflow: TextOverflow.ellipsis,
                // textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          SizedBox(
            height: 70.h,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const DisasterInfo()));
            },
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const DisasterInfo()));
              },
              child:  Center(
                child: AvatarGlow(
                  endRadius: 80.0,
                  animate: true,
                  duration: Duration(milliseconds: 2000),
                  glowColor: Color(0xFFF4727A),
                  repeatPauseDuration: Duration(milliseconds: 100),
                  showTwoGlows: true,
                  child: CircleAvatar(
                      backgroundColor: Color(0xFFF4727A),
                      radius: 55,
                      child: Text(
                        "SOS",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 180.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(left: 16.w),
                height: 92.h,
                width: 352.w,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(163, 161, 161, 1),
                          blurRadius: 4,
                          offset: Offset(0, 2))
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 12.h),
                      child: Text(
                        "Your Address",
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.h),
                      child: SizedBox(
                        width: 260.w,
                        child: Text(
                          "kellumbakum , chennai . pincode - 6000127",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
