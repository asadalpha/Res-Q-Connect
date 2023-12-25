import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrgAlertTile extends StatefulWidget {
  final String orgName;
  final String orgdisp;
  final String disasterType;
  final String postTime;
  final String image;
  const OrgAlertTile(
      {super.key,
      required this.orgName,
      required this.orgdisp,
      required this.disasterType,
      required this.image,
      required this.postTime});

  @override
  State<OrgAlertTile> createState() => _OrgAlertTileState();
}

class _OrgAlertTileState extends State<OrgAlertTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      padding: EdgeInsets.only(left: 12.w, bottom: 20.h, top: 10.h),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 25.h,
                  width: 57.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Text(
                      widget.orgName,
                      style: TextStyle(fontSize: 13.sp, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 70.h,
                  width: 200.w,
                  child: Text(
                    widget.orgdisp,
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  widget.postTime,
                  style: TextStyle(fontSize: 11.sp),
                )
              ],
            ),
            SizedBox(
              width: 30.w,
            ),
            Padding(
              padding: EdgeInsets.only(right: 15.w),
              child: SizedBox(width: 120.w, child: Image.asset(widget.image)),
            )
          ],
        ),
      ),
    );
  }
}
