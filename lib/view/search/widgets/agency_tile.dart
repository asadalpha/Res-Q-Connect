import 'package:resq_connect/view/userflow/orgside/orgs/org_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AgencyTile extends StatelessWidget {
  const AgencyTile({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return const OrgDetailPage();
        }));
      },
      child: Container(
        padding: EdgeInsets.only(
          bottom: 10.h,
        ),
        height: 100.h,
        width: double.maxFinite,
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: Colors.grey,
        ))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 20.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Direct Relief",
                  style: TextStyle(fontSize: 18.sp, color: Colors.black),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Medical Resources",
                  style:
                      TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w100),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Active 2 days ago",
                  style: TextStyle(fontSize: 10.sp),
                )
              ],
            ),
            SizedBox(
              width: 100.w,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: SizedBox(
                  width: 120.w,
                  child: Image.asset(
                    "assets/images/ndrf.png",
                    scale: 1,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
