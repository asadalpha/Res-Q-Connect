import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../users/disaster_info_page.dart';

class SOSscreen extends StatelessWidget {
  const SOSscreen({super.key});

  @override
  Widget build(BuildContext context) {
    String myLocation = "Chennai";
    // bool abc = false;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
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
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 12.sp,
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
              child: Center(
                child: AvatarGlow(
                  endRadius: 100.0,
                  animate: true,
                  duration: const Duration(milliseconds: 2000),
                  glowColor: Theme.of(context).primaryColor,
                  repeatPauseDuration: const Duration(milliseconds: 100),
                  showTwoGlows: true,
                  child: CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      radius: 55,
                      child: const Text(
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
            SizedBox(
              height: 180.h,
            ),
            Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                //color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Your Current Location: ',
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500)),
                    Text(myLocation,
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
