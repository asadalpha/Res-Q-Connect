import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResoursesTile extends StatefulWidget {
  const ResoursesTile({super.key});

  @override
  State<ResoursesTile> createState() => _ResoursesTileState();
}

class _ResoursesTileState extends State<ResoursesTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12.w, bottom: 20.h, top: 0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 70.h,
                width: 200.w,
                child: Text(
                  "[Guide] How to react in case of natural disaster",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 10.h,
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
                width: 120.w, child: Image.asset("assets/images/ndma.png")),
          )
        ],
      ),
    );
  }
}
