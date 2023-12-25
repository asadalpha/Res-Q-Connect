// ignore_for_file: unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
   String? username;

  // @override
  // void initState() {
  //   super.initState();
  //   fetchUsername();
  // }
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<String> aboutList = [
    "Location Service",
    "Notifications",
    "General",
    "Privacy",
    "Help Center",
    "Settings",
  ];

  List<IconData> iconList = [
    Icons.location_on,
    Icons.notifications_outlined,
    Icons.grid_view_outlined,
    Icons.lock_outline,
    Icons.help_outline,
    Icons.settings_outlined
  ];

  List<Color> colors = const [
    Colors.green,
    Colors.pink,
    Colors.blue,
    Colors.yellow,
    Colors.red,
    Colors.cyan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 235, 235),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 35),
            Center(
              child: CircleAvatar(
                radius: 55,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://nationaltoday.com/wp-content/uploads/2022/05/74-Robert-Pattinson.jpg.webp",
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              username != null ? username! : 'Robert',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: aboutList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: const Color.fromARGB(255, 240, 240, 239),
                          child: Icon(
                            iconList[index],
                            color: const Color.fromARGB(255, 36, 35, 35),
                          ),
                        ),
                        title: Text(
                          aboutList[index],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}