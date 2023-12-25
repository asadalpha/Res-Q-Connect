import 'package:flutter/material.dart';

class AboutPageUser extends StatefulWidget {
  const AboutPageUser({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AboutPageUserState createState() => _AboutPageUserState();
}

class _AboutPageUserState extends State<AboutPageUser> {
  List<String> aboutList = [
    "Location Service",
    "Notifications",
    "General",
    "Privacy",
    "Help Center",
    "Settings",
  ];

  List<IconData> iconlist = [
    Icons.location_on,
    Icons.notifications_outlined,
    Icons.grid_view_outlined,
    Icons.lock_outline,
    Icons.help_outline,
    Icons.settings_outlined
  ];

  List<Color> color = const [
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
            const Text(
              "Robert Pattison",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                            iconlist[index],
                            color: const Color.fromARGB(255, 36, 35, 35),
                          ),
                        ),
                        title: Text(
                          aboutList[index],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        // trailing: IconButton(
                        //   onPressed: () {
                        //     _onEditButtonPressed(index);
                        //   },
                        //   icon: const Icon(Icons.edit_outlined),
                        // ),
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

  // ignore: unused_element
  void _onEditButtonPressed(int index) {
    setState(() {
      // Update the property associated with the tapped item (e.g., aboutList).
      // For demonstration purposes, we'll simply append " Edited" to the item.
    });
  }
}
