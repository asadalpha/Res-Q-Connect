import 'package:resq_connect/view/search/mapscreendemo.dart';
import 'package:resq_connect/view/search/widgets/filter_screen.dart';
import 'package:resq_connect/view/search/widgets/agency_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  double _currentValue = 10;
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController discriptioncontroller = TextEditingController();
  final List<String> category = [
    "Fire",
    "Flood",
    "Gas",
    "Food",
    "Economic",
    "Shelter"
  ];

  final TextEditingController titlecontroller1 = TextEditingController();
  final TextEditingController discriptioncontroller2 = TextEditingController();
  final List<String> category2 = [
    "Government",
    "Hybrid",
    "Private",
    "NGO",
  ];
  final Map<String, Color> categoryColors = {
    "Personal": const Color.fromARGB(255, 122, 204, 125),
    "Work": const Color.fromARGB(255, 72, 95, 223),
    "Casual": const Color.fromARGB(255, 219, 162, 76),
  };

  late String selectedCateg;
  String id = "";
  List<Select> selected = [];

  late String selectedCateg2;
  String id2 = "";
  List<Select> selected2 = [];

  @override
  void initState() {
    selectedCateg = category[0];
    selectedCateg2 = category2[0];
    super.initState();
  }

  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    Function? openModelSheet(BuildContext context) {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SizedBox(
                height: 700,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      const Center(
                        child: Text(
                          "Search an Organization",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Divider(
                          thickness: 1.5,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Area of Expertise",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 80,
                        child: ListView.builder(
                          itemCount: category.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            final categ = category[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedCateg = categ;
                                    //debugPrint(categ);
                                  });
                                },
                                child: Chip(
                                  backgroundColor: selectedCateg == categ
                                      ? const Color(0xFFF4727A)
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  label: Text(categ),
                                  labelStyle: TextStyle(
                                    color: selectedCateg == categ
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Type of Organization",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 80,
                        child: ListView.builder(
                          itemCount: category2.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            final categ2 = category2[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedCateg2 = categ2;
                                    //debugPrint(categ);
                                  });
                                },
                                child: Chip(
                                  backgroundColor: selectedCateg2 == categ2
                                      ? const Color(0xFFF4727A)
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  label: Text(categ2),
                                  labelStyle: TextStyle(
                                    color: selectedCateg2 == categ2
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                              'Distance: ${_currentValue.toStringAsFixed(2)} km'),
                          Slider(
                            activeColor: const Color(0xFFF4727A),
                            value: _currentValue,
                            min: 0.0, // Minimum value for the slider
                            max: 100.0, // Maximum value for the slider
                            onChanged: (double value) {
                              setState(() {
                                _currentValue = value;
                              });
                            },
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 50),
                                backgroundColor: const Color(0xFFF4727A),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Search",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      );
    }

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.maxFinite,
          // decoration: !isSearch
          //     ? const BoxDecoration(
          //         image: DecorationImage(
          //         image: ExactAssetImage("assets/images/map.png"),
          //         fit: BoxFit.fill,
          //       ))
          //     : const BoxDecoration(),
          child: !isSearch
              ? Column(
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromRGBO(173, 172, 172, 1),
                                blurRadius: 20,
                                offset: Offset(0, 6))
                          ],
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      height: 53.h,
                      margin: EdgeInsets.only(
                        left: 10.w,
                        right: 10.w,
                      ),
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            isSearch = true;
                          });
                        },
                        style: const TextStyle(backgroundColor: Colors.white),
                        autocorrect: false,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: const Icon(
                            Icons.search_rounded,
                            color: Colors.grey,
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.filter_list_outlined),
                            onPressed: () {
                              openModelSheet(
                                  context); // Call the function to show the bottom modal sheet
                            },
                            color: Colors.black,
                          ),
                          hintText: "Search communities ",
                          hintStyle: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w200),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.8,
                          width: MediaQuery.of(context).size.width,
                          child: const Column(
                            children: [
                              Expanded(child: MapSceen2()),
                            ],
                          )),
                    ),
                  ],
                )
              : Column(children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromRGBO(173, 172, 172, 1),
                              blurRadius: 20,
                              offset: Offset(0, 6))
                        ],
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    height: 53.h,
                    margin: EdgeInsets.only(
                      left: 10.w,
                      right: 10.w,
                    ),
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          isSearch = true;
                        });
                      },
                      style: const TextStyle(backgroundColor: Colors.white),
                      autocorrect: false,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: const Icon(
                          Icons.search_rounded,
                          color: Colors.grey,
                        ),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.filter_list_outlined),
                          onPressed: () {
                            openModelSheet(
                                context); // Call the function to show the bottom modal sheet
                          },
                          color: Colors.black,
                        ),
                        hintText: "Search communities ",
                        hintStyle: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w200),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 50.h,
                  // ),
                  // const Text("Search Results "),
                  SingleChildScrollView(
                    child: ListView.builder(
                      physics:
                          const NeverScrollableScrollPhysics(), // Disable scrolling of this ListView
                      shrinkWrap: true,
                      itemCount: 5,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return const AgencyTile();
                      },
                    ),
                  )
                ]),
        ),
      ),
    );
  }
}
