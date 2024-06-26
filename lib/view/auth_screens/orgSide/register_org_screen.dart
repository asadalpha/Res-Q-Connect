import 'dart:io';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:resq_connect/view/widgets/snackbar.dart';
import 'package:resq_connect/view/userflow/orgside/orgs/navpageorg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:resq_connect/view/userflow/orgside/orgs/services/org_register_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class RegisterOrgScreen extends StatefulWidget {
  static const String routeName = "/add-product-screen";
  const RegisterOrgScreen({super.key});

  @override
  State<RegisterOrgScreen> createState() => _RegisterOrgScreenState();
}

class _RegisterOrgScreenState extends State<RegisterOrgScreen> {
  final TextEditingController orgNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController orgTypeController = TextEditingController();
  // final AdminServices adminservices = AdminServices();
  String category = "Mobiles";
  final _addProductKey = GlobalKey<FormState>();
  late String latitude = "";
  late String longitude = "";

  @override
  void dispose() {
    super.dispose();
    orgNameController.dispose();
    descriptionController.dispose();
    locationController.dispose();
    orgTypeController.dispose();
  }

  List<String> orgCategories = [
    "Fire",
    "Earthquake",
    "Flood",
  ];
  void _submitForm() {
    if (orgNameController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        locationController.text.isEmpty ||
        orgTypeController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Enter all the required fields")));
      return;
    }

    // If all validations pass, call postOrgDataToServer and navigate
    postOrgDataToServer(
      name: orgNameController.text,
      type: orgTypeController.text,
      description: descriptionController.text,
      location: locationController.text,
      lat: latitude,
      long: longitude,
    );

    // Navigate to the desired screen (replace with your navigation logic)
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const BottomNavBarOrg(),
      ),
    );

    showSnackBar(context, "Data posted successfully !");
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
        latitude = position.latitude.toStringAsFixed(2);
        longitude = position.longitude.toStringAsFixed(2);
      });
    }
    if (permission == LocationPermission.whileInUse) {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        latitude = position.latitude.toStringAsFixed(2);
        longitude = position.longitude.toStringAsFixed(2);
      });
    }
    List<Placemark> placemarks = await placemarkFromCoordinates(
        double.parse(latitude), double.parse(longitude));
    //print(latitude);
    //print(longitude);
    // print(placemarks.last.locality);
  }

  void getLocation() {
    _getCurrentLocation();
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  late File pickedImageFile;
  List<File> images = [];
  void addImages() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage == null) {
      return;
    }

    setState(() {
      pickedImageFile = File(pickedImage.path);
      // images = pickedImageFile;
      images.add(pickedImageFile);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Form(
              key: _addProductKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    images.isNotEmpty
                        ? CarouselSlider(
                            items: images.map((e) {
                              return Builder(
                                  builder: ((BuildContext context) =>
                                      Image.file(
                                        e,
                                        fit: BoxFit.cover,
                                        height: 200,
                                      )));
                            }).toList(),
                            options: CarouselOptions(
                              viewportFraction: 1,
                              height: 210,
                            ))
                        : GestureDetector(
                            onTap: addImages,
                            child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: const Radius.circular(10),
                                dashPattern: const [10, 4],
                                strokeCap: StrokeCap.round,
                                child: Container(
                                  width: double.infinity,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.folder_open_outlined,
                                        size: 40,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Select images for Org",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255)),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                    const SizedBox(
                      height: 14,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'data is required';
                        }
                        return null;
                      },
                      controller: orgNameController,
                      autocorrect: false,
                      decoration: InputDecoration(
                        labelText: "Organization Name",
                        hintText: "Enter your Org name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'data is required';
                        }
                        return null;
                      },
                      controller: descriptionController,
                      autocorrect: false,
                      maxLines: 6,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        labelText: "Description",
                        hintText: "Enter the description of the Organization ",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'data is required';
                        }
                        return null;
                      },
                      controller: locationController,
                      autocorrect: false,
                      decoration: InputDecoration(
                        labelText: "Location",
                        hintText: "Enter the Location",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'data is required';
                        }
                        return null;
                      },
                      controller: orgTypeController,
                      autocorrect: false,
                      decoration: InputDecoration(
                        labelText: "Org Type",
                        hintText: "Enter the Organization type",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                backgroundColor:
                                    Theme.of(context).primaryColor),
                            onPressed: () {
                              _submitForm();
                            },
                            child: const Text(
                              'Submit',
                              style: TextStyle(
                                  color: Colors.white,
                                  // fontFamily: "Montserrat",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            )),
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
