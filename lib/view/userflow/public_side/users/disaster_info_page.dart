// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:resq_connect/utils/theme.dart';

import 'moreinfo.dart';

class DisasterInfo extends StatefulWidget {
  const DisasterInfo({super.key});

  @override
  State<DisasterInfo> createState() => _DisasterInfoState();
}

class _DisasterInfoState extends State<DisasterInfo> {
  List<String> _dropdownItems = ['Ongoing', 'Closed', 'On Hold'];
  String _selectedItem = ' Ongoing';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  "Report Your Disaster",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const MoreInfoOrg(
                                disasterType: 'Water Shortage',
                              )));
                    },
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        border: Border.all(color: appPrimaryColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Column(
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Icon(
                            Icons.water,
                            color: iconColor,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Water Shortage",
                            style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const MoreInfoOrg(
                                disasterType: 'Famine',
                              )));
                    },
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        border: Border.all(color: appPrimaryColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Column(
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Icon(
                            Icons.local_dining,
                            color: iconColor,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Famine",
                            style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const MoreInfoOrg(
                                disasterType: 'Flood',
                              )));
                    },
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        border: Border.all(color: appPrimaryColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Column(
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Icon(
                            Icons.flood_outlined,
                            color: iconColor,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Flood",
                            style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const MoreInfoOrg(
                                disasterType: 'Earthqauke',
                              )));
                    },
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        border: Border.all(color: appPrimaryColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Column(
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Icon(
                            Icons.public_outlined,
                            color: iconColor,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Earthqauke",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                color: textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const MoreInfoOrg(
                                disasterType: 'Cyclone',
                              )));
                    },
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        border: Border.all(color: appPrimaryColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Column(
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Icon(
                            Icons.cyclone,
                            color: iconColor,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Cyclone",
                            style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const MoreInfoOrg(
                                disasterType: 'Fire Hazard',
                              )));
                    },
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        border: Border.all(color: appPrimaryColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Column(
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Icon(
                            Icons.fire_truck_outlined,
                            color: iconColor,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Fire Hazard",
                            style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const MoreInfoOrg(
                                disasterType: 'Landslide',
                              )));
                    },
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        border: Border.all(color: appPrimaryColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Column(
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Icon(
                            Icons.landslide_outlined,
                            color: iconColor,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Landslide",
                            style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const MoreInfoOrg(
                                disasterType: 'Others',
                              )));
                    },
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        border: Border.all(color: appPrimaryColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Column(
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Icon(
                            Icons.alarm,
                            color: iconColor,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Others",
                            style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
