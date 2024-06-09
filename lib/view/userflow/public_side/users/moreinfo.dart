// ignore_for_file: unused_local_variable

import 'dart:async';
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:resq_connect/model/sosService/service.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import 'package:geocoding/geocoding.dart';
import 'package:resq_connect/utils/theme.dart';

class MoreInfoOrg extends StatefulWidget {
  const MoreInfoOrg({super.key, required this.disasterType});
  final String disasterType;
  @override
  State<MoreInfoOrg> createState() => _MoreInfoOrgState();
}

// ignore: unused_element
String _selectedDisasterType = 'Earthquake';
late File pickedImageFile;
List<File> images = [];
final List<String> disasterTypes = [
  'Earthquake',
  'Flood',
  'Wildfire',
  'Tornado',
  'Hurricane',
  'Volcano',
  'Industrial accident',
  'Terrorist attack',
  'Other',
];

class _MoreInfoOrgState extends State<MoreInfoOrg> {
  final TextEditingController detailsController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  late String latitude = "0.0";
  late String longitude = "0.0";

  List<File> imagesList = <File>[];
  final String error = 'No Error Detected';
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  void addImages() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedImage == null) {
      return;
    }

    setState(() {
      pickedImageFile = File(pickedImage.path);
      // images = pickedImageFile;
      images.add(pickedImageFile);
    });
  }

  Future<Position?> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception("Service not enabled");
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception("Location permissoion permanently");
      }
      if (permission == LocationPermission.deniedForever) {
        throw Exception("Location permissoion permanently denied");
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        // latitude = "${position.latitude}";
        // longitude = "${position.longitude}";
        latitude = position.latitude.toStringAsFixed(2);
        longitude = position.longitude.toStringAsFixed(2);
      });
    }
    if (permission == LocationPermission.whileInUse) {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        // latitude = "${position.latitude}";
        // longitude = "${position.longitude}";
        latitude = position.latitude.toStringAsFixed(2);
        longitude = position.longitude.toStringAsFixed(2);
      });
    }
    List<Placemark> placemarks = await placemarkFromCoordinates(
        double.parse(latitude), double.parse(longitude));
    // print(latitude);
    // print(longitude);
    // print(placemarks.last.locality);
  }

  void getLocation() {
    _getCurrentLocation();
  }

  @override
  void dispose() {
    super.dispose();
    images.clear();
    detailsController.dispose();
    contactController.dispose();
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

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
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Details",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              images.isNotEmpty
                  ? Container(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: CarouselSlider(
                          items: images.map((e) {
                            return Builder(
                                builder: ((BuildContext context) => Image.file(
                                      e,
                                      fit: BoxFit.cover,
                                      height: 200,
                                    )));
                          }).toList(),
                          options: CarouselOptions(
                            viewportFraction: 1,
                            height: 210,
                          )),
                    )
                  : const SizedBox(
                      height: 1,
                    ),
              Center(
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a disaster type';
                    }
                    return null;
                  },
                  showCursor: true,
                  cursorWidth: 2,
                  cursorColor: Colors.white,
                  controller: detailsController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      hintText: 'Disaster Details'),
                  maxLines: 3,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                showCursor: true,
                cursorWidth: 2,
                cursorColor: Colors.white,
                controller: contactController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    hintText: 'Contact Number'),
                maxLines: 1,
              ),
              const SizedBox(
                height: 20,
              ),
              if (images.isEmpty)
                const Center(
                  child: Text(
                    "Add Photos ",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              const SizedBox(
                height: 20,
              ),
              if (images.isEmpty)
                Center(
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: const Color.fromARGB(255, 50, 52, 65),
                    child: IconButton(
                        onPressed: addImages, icon: const Icon(Icons.add)),
                  ),
                ),
              // const Spacer(),
              const SizedBox(
                height: 50,
              ),
              _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            height: 45,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                //print(widget.disasterType);
                                final now = DateTime.now();
                                String time =
                                    DateFormat('HH:mm:ss').format(now);
                                String date = DateFormat('d/M/y')
                                    .format(now); // 28/03/2020
                                setState(() {
                                  _isLoading = true;
                                });
                                uploadReport(
                                    context: context,
                                    imageFile: images[0],
                                    name: "name",
                                    dtype: widget.disasterType,
                                    description: detailsController.text,
                                    contact: contactController.text,
                                    lat: latitude,
                                    long: longitude,
                                    date: date,
                                    time: time,
                                    status: "Ongoing");
                                Timer.periodic(const Duration(seconds: 2), (_) {
                                  setState(() {
                                    _isLoading = false;
                                  });
                                  Navigator.pop(context);
                                });
                                // Time
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: appPrimaryColor),
                              child: const Text(
                                "Report",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ),
                    )
            ],
          ),
        ),
      )),
    );
  }
}
