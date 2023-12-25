
import 'package:flutter/material.dart';


import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePageTile extends StatefulWidget {
  final String settingName;
  const ProfilePageTile({
    super.key,
    required this.settingName,
  });

  @override
  State<ProfilePageTile> createState() => _ProfilePageTileState();
}

class _ProfilePageTileState extends State<ProfilePageTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: 15.h, bottom: 10.h, left: 20.w, right: 10.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 10.w,
              ),
              CircleAvatar(
                radius: 32.sp,
                backgroundColor: const Color.fromARGB(255, 252, 236, 237),
                child: const Icon(Icons.lock,
                    color: Color.fromRGBO(233, 127, 134, 1)),
              ),
              SizedBox(
                width: 35.w,
              ),
              Text(
                // "Privacy and setting ",
                widget.settingName,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                width: 40.w,
              ),
              const Icon(Icons.arrow_forward_ios),
              SizedBox(
                width: 10.w,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
