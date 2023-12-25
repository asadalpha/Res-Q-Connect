import 'package:resq_connect/view/widgets/alert_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenPublic extends StatefulWidget {
  const HomeScreenPublic({super.key});

  @override
  State<HomeScreenPublic> createState() => _HomeScreenPublicState();
}

class _HomeScreenPublicState extends State<HomeScreenPublic> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      primary: false,
      child: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 8.w,
              ),
              const Icon(
                Icons.location_on_sharp,
                color: Colors.grey,
                size: 25,
              ),
              SizedBox(
                width: 12.w,
              ),
              Text(
                "Vellore institute of technology,chennai ",
                softWrap: true,
                maxLines: 2,
                style: TextStyle(fontSize: 13.sp),
              )
            ],
          ),
          SizedBox(
            height: 250.h,
            width: 400.w,
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 13.w, top: 13.h),
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 25.w, top: 10.h),
                        height: 230.h,
                        width: 300.w,
                        child: Image.asset("assets/images/backgroundTile.png",
                            fit: BoxFit.fill),
                        // child: Text("pae"),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 10.w, top: 20.h),
                          child: Text(
                            "Food shortage in Syria",
                            style:
                                TextStyle(fontSize: 15.sp, color: Colors.white),
                          )),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 14.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 12.w, top: 20.h),
                child: Text(
                  "Alerts",
                  style:
                      TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          ListView.builder(
            physics:
                const NeverScrollableScrollPhysics(), // Disable scrolling of this ListView
            shrinkWrap: true,
            itemCount: 5,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return InkWell(onTap: () {}, child: const AlertTile());
            },
          )
        ],
      ),
    );
  }
}
