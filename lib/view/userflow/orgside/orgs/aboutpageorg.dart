// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:resq_connect/view/about/notifications_screen.dart';
import 'package:resq_connect/view/about/privay_policy_page.dart';
import 'package:resq_connect/view/about/service_screen.dart';
import 'package:resq_connect/view/about/settings_screen.dart';
import 'package:resq_connect/view/about/log_out.dart';

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

  List<String> aboutList = [
    "Service",
    "Notifications",
    "Privacy Policy",
    "Settings",
    "Log Out",
  ];

  List<IconData> iconList = [
    Icons.location_on,
    Icons.notifications_outlined,
    // Icons.grid_view_outlined,
    Icons.lock_outline,
    Icons.help_outline,
    Icons.settings_outlined
  ];

  List<Widget> widgetList = [
    const ServiceScreen(),
    const NotificatiosScreen(),
    const PrivacyPolicyScreen(),
    const SettingsScreen(),
    //const LogOutScreen(),
    const LogOutWidget()
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
      body: SafeArea(
        child: Column(
          children: [
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
                  color: Color.fromARGB(255, 50, 50, 54),
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
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => widgetList[index]));
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor:
                                const Color.fromARGB(255, 240, 240, 239),
                            child: Icon(
                              iconList[index],
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          title: Text(
                            aboutList[index],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
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
