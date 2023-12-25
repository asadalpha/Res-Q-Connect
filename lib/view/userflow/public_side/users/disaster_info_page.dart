// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

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
    final _color = const Color.fromARGB(255, 50, 52, 65);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_rounded)),
              const SizedBox(
                height: 15,
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
                height: 10,
              ),
              const SizedBox(
                height: 10,
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
                                disasterType: 'Water Shortage',
                              )));
                    },
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        border: Border.all(color: _color),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Icon(
                            Icons.water,
                            color: _color,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Water Shortage",
                            style: TextStyle(
                                color: _color,
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
                        border: Border.all(color: _color),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Icon(
                            Icons.local_dining,
                            color: _color,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Famine",
                            style: TextStyle(
                                color: _color,
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
                        border: Border.all(color: _color),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Icon(
                            Icons.flood_outlined,
                            color: _color,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Flood",
                            style: TextStyle(
                                color: _color,
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
                        border: Border.all(color: _color),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Icon(
                            Icons.public_outlined,
                            color: _color,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Earthqauke",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                color: _color,
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
                        border: Border.all(color: _color),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Icon(
                            Icons.cyclone,
                            color: _color,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Cyclone",
                            style: TextStyle(
                                color: _color,
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
                        border: Border.all(color: _color),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Icon(
                            Icons.fire_truck_outlined,
                            color: _color,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Fire Hazard",
                            style: TextStyle(
                                color: _color,
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
                        border: Border.all(color: _color),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Icon(
                            Icons.landslide_outlined,
                            color: _color,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Landslide",
                            style: TextStyle(
                                color: _color,
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
                        border: Border.all(color: _color),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Icon(
                            Icons.alarm,
                            color: _color,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Others",
                            style: TextStyle(
                                color: _color,
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
