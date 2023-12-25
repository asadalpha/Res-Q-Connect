import 'package:resq_connect/view/profile/widgets/profile_page_tile.dart';
import 'package:flutter/material.dart';


import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 37.h,
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back_ios_new_rounded)),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80.sp,
                  backgroundColor: Colors.white,
                  child: Image.asset("assets/images/profilepic.png",
                      fit: BoxFit.fill),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: Text(
                "Prabhdeep",
                style: TextStyle(fontSize: 25.sp, fontFamily: "Roboto"),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            ListView.builder(
              physics:
                  const NeverScrollableScrollPhysics(), // Disable scrolling of this ListView
              shrinkWrap: true,
              itemCount: 8,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {},
                    child: const ProfilePageTile(
                      settingName: "Privacy and Setting",
                    ));
              },
            )
          ],
        ),
      ),
    ));
  }
}
