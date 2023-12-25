import 'package:resq_connect/view/search/mapscreendemo.dart';
import 'package:resq_connect/view/userflow/orgside/orgs/resoursesTile.dart';
import 'package:resq_connect/view/widgets/alert_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrgDetailPage extends StatefulWidget {
  const OrgDetailPage({super.key});

  @override
  State<OrgDetailPage> createState() => _OrgDetailPageState();
}

class _OrgDetailPageState extends State<OrgDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                    height: 250.h,
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage("assets/images/ndrf2.jpg"),
                        fit: BoxFit.fill,
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 6.w, top: 25.h),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 30.sp,
                        weight: 50,
                      )),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 13.w, top: 25.h),
              child: Text(
                "National disaster Relief force",
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Montserrat-SemiBold"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.w, top: 20.h),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 23.sp,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    "chennai , India",
                    style: TextStyle(fontSize: 12.sp),
                  ),
                  SizedBox(
                    width: 115.w,
                  ),
                  Icon(
                    Icons.timer_outlined,
                    size: 20.sp,
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  Text(
                    "20 mins away",
                    style: TextStyle(fontSize: 12.sp),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10.w, top: 15.h),
              height: 1,
              width: 370.w,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
            ),
            Container(
              padding: EdgeInsets.only(left: 15.w, top: 20.h),
              width: 350.w,
              child: Text(
                "Contact No : 999999999",
                style: TextStyle(fontSize: 12.sp),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15.w, top: 9.h),
              width: 350.w,
              child: Text(
                "Email :  www.ndrf.gov.in",
                style: TextStyle(fontSize: 12.sp),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10.w, top: 15.h),
              height: 1,
              width: 370.w,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
            ),
            Container(
              padding: EdgeInsets.only(left: 12.w, top: 20.h),
              width: 350.w,
              child: Text(
                "The National Disaster Response Force (NDRF) is a specialized paramilitary force in India dedicated to disaster response, search and rescue operations, and disaster relief efforts, deployed for both natural and man-made disasters.",
                style: TextStyle(fontSize: 15.sp),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10.w, top: 20.h),
              height: 1,
              width: 370.w,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.w, top: 15.h),
              child: Text(
                "Resourses to learn",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontFamily: "Montserrat-SemiBold",
                ),
              ),
            ),
            ListView.builder(
              physics:
                  const NeverScrollableScrollPhysics(), // Disable scrolling of this ListView
              shrinkWrap: true,
              itemCount: 5,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return InkWell(onTap: () {}, child: const ResoursesTile());
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 10.w, top: 15.h),
              height: 1,
              width: 370.w,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 14.w, top: 15.h),
              child: Text(
                "Click to view location",
                style: TextStyle(
                    fontSize: 23.sp,
                    fontFamily: "Montserrat-SemiBold",
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            SingleChildScrollView(
                child: Center(
              child: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return MapSceen2();
                  }));
                },
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(173, 172, 172, 1),
                          blurRadius: 20,
                          offset: Offset(0, 11))
                    ],
                    image: const DecorationImage(
                        image: AssetImage("assets/images/map.png")),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.only(bottom: 50.h),
                  height: 300.h,
                  width: 300.w,
                ),
              ),
            )),
            SizedBox(
              height: 40.h,
            ),
          ],
        ),
      ),
    );
  }
}
