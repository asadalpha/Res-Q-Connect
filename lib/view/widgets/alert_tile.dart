import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlertTile extends StatefulWidget {
  const AlertTile({super.key});

  @override
  State<AlertTile> createState() => _AlertTileState();
}

class _AlertTileState extends State<AlertTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      padding: EdgeInsets.only(left: 12.w, bottom: 20.h, top: 10.h),
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
                    "World",
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
                  "America to Stop initiating War and spread world peace",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Posted 10 hours Ago",
                style: TextStyle(fontSize: 11.sp),
              )
            ],
          ),
          SizedBox(
            width: 30.w,
          ),
          Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: SizedBox(
                width: 120.w,
                child: Image.asset("assets/images/AmericanFlag.png")),
          )
        ],
      ),
    );
  }
}
