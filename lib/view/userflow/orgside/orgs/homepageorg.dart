import 'dart:async';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'services/reports_services.dart';

class HomePageOrg extends StatefulWidget {
  const HomePageOrg({super.key});

  @override
  State<HomePageOrg> createState() => _HomePageOrgState();
}

class _HomePageOrgState extends State<HomePageOrg> {
  String description = '';
  List<dynamic> data = [];
  List<String?> Locality = [];
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future<dynamic> fetchData() async {
    try {
      final responseData = await fetchDataFromApi();
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
      debugPrint('Error: $e');
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w400,
                      fontSize: 24.sp,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications_none,
                      size: 26.sp,
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
                    image: AssetImage("assets/images/people_2.png"),
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
                    fontSize: 26.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              FutureBuilder(
                future: fetchData(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            children: [
                              Container(
                                // padding: const EdgeInsets.only(),
                                decoration: BoxDecoration(
                                  // color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10.sp),
                                  border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data[index]["dtype"] ??
                                                "Disaster type",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: "Montserrat",
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.sp),
                                          ),
                                          SizedBox(
                                            height: 6.h,
                                          ),
                                          Text(
                                            "Description: ${data[index]["description"] ?? " Description"} ",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Text(
                                            "Reported by : ${data[index]["name"] ?? " Name "} ",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Text(
                                            "Contact : ${data[index]["contact"]} ",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w400,
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
                                              SizedBox(
                                                width: 100.w,
                                                child: Text(
                                                  index < Locality.length
                                                      ? Locality[index] ??
                                                          "location"
                                                      : "Fetching location...",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 2,
                                              ),
                                              SizedBox(
                                                width: 60.w,
                                                child: Text(
                                                  style: TextStyle(
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  "${data[index]["date"] ?? "date"} ${data[index]["time"] ?? "time"}",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
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
                                          // child: data[index]["image"] != null
                                          //     ? Image.network(
                                          //         data[index]["image"],
                                          //         fit: BoxFit.fill,
                                          //       )
                                          //     : const Placeholder(),
                                          child: Image.asset(
                                              'assets/images/flood.jpeg'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              if (data.isEmpty)
                Center(
                  child: Container(
                    padding: EdgeInsets.only(top: 150.h),
                    child: const Text("Waiting for data. Please Wait. "),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
