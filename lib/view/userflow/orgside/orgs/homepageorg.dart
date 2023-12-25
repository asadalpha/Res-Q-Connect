import 'dart:async';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'services/reports_services.dart';



class HomePageOrg extends StatefulWidget {
  const HomePageOrg({Key? key});

  @override
  State<HomePageOrg> createState() => _HomePageOrgState();
}

class _HomePageOrgState extends State<HomePageOrg> {
  String description = '';
  List<dynamic> data = [];
  List<String?> Locality = [];
  @override
  void initState() {
    // getdate();
    // fetchData();
    super.initState();
  }

  Future<dynamic> fetchData() async {
    try {
      final responseData = await fetchDataFromApi();
      final res = responseData[0]["name"].toString();
      print(responseData[0]["name"].toString());
      print("hello");
      print(responseData);

      setState(() {
        data = responseData;
      });
      List<String?> locality = [];

      for (int i = 0; i < responseData.length; i++) {
        String latitude = responseData[i]['lat'];
        String longitude = responseData[i]['long'];
        List<Placemark> placemarks = await placemarkFromCoordinates(
            double.parse(latitude), double.parse(longitude));

        String? loc = placemarks.last.street;
        locality.add(loc);
      }

      setState(() {
        Locality = locality;
      });

      return responseData;
    } catch (e) {
      // Handle any errors that occur during the HTTP request
      print('Error: $e');
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 17.w, top: 12.h),
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w400,
                      fontSize: 24.sp,
                    ),
                  ),
                  SizedBox(
                    width: 200.w,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications_none,
                      size: 30.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/images/people.png"),
                    fit: BoxFit.cover,
                  ),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10.sp),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Reported Disasters",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w400,
                    fontSize: 22.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              // if (data.isNotEmpty)

              // CAUTION :::: REMOVE FUTURE BUILDER AFTER CREATING DEMO VIDEO FIND BETTER SOLUTION
              FutureBuilder(
                future: fetchData(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                left: 2.w,
                                bottom: 12.h,
                                top: 2.h,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        // "Food Shortage",
                                        data[index]["dtype"] ?? "Disaster type",
                                        overflow: TextOverflow.ellipsis,
                                        // data[index]["description"] ??
                                        //     "description",
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.sp),
                                      ),
                                      SizedBox(
                                        height: 6.h,
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                        width: 180.w,
                                        child: Text(
                                          // "The area is flooded with water and people are stuck",
                                          "Description: ${data[index]["description"] ?? " Description"} ",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                        width: 180.w,
                                        child: Text(
                                          // "The area is flooded with water and people are stuck",
                                          "Reported by : ${data[index]["name"] ?? " Name "} ",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                        width: 180.w,
                                        child: Text(
                                          // "The area is flooded with water and people are stuck",
                                          "Contact : ${data[index]["contact"]} ",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.location_pin,
                                            size: 13,
                                          ),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          SizedBox(
                                            width: 100.w,
                                            child: Text(
                                              Locality[index] ?? "location ",
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          SizedBox(
                                            width: 80.w,
                                            child: Text(
                                              data[index]["date"] ??
                                                  " date " +
                                                      data[index][" time"] ??
                                                  " time ",
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 10.w),
                                    child: SizedBox(
                                      height: 100.h,
                                      width: 110.w,
                                      child: Image.network(
                                        data[index]["image"] ??
                                            const Placeholder(),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 20.w),
                              child: Divider(
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
              if (data.isEmpty)
                Container(
                  padding: EdgeInsets.only(top: 150.h),
                  child: const Text("Waiting for data. Please Wait. "),
                )
            ],
          ),
        ),
      ),
    );
  }
}
