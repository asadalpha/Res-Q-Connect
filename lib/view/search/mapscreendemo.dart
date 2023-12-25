import 'package:resq_connect/view/userflow/orgside/orgs/services/reports_services.dart';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSceen2 extends StatefulWidget {
  const MapSceen2({super.key});

  @override
  State<MapSceen2> createState() => _MapSceen2State();
}

class _MapSceen2State extends State<MapSceen2> {
  static const initialCameraPos =
      CameraPosition(target: LatLng(12.8406, 80.1534), zoom: 11.5);

  GoogleMapController? _googleMapController;
  late Marker _origin = const Marker(markerId: MarkerId(""));
  List<dynamic> data = [];
  Set<Marker> markers = {};
  List<String> images = [];

  @override
  void dispose() {
    _googleMapController;
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    fetchDataFromApi();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final responseData = await fetchDataFromApi();
      setState(() {
        data = responseData;
      });
      disasterLocations();
    } catch (e) {
      // Handle any errors that occur during the HTTP request
      //print('Error: $e');
    }
  }

  Future<Uint8List> getImages(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  void disasterLocations() async {
    for (int i = 0; i < data.length; i++) {
      if (data[i]['dtype'] == "Fire") {
        images.add("assets/dtypeImages/fire.png");
      } else if (data[i]['dtype'] == "Water Shortage") {
        images.add("assets/dtypeImages/water_shortage.png");
      } else if (data[i]['dtype'] == "Famine") {
        images.add("assets/dtypeImages/famine.png");
      } else if (data[i]['dtype'] == "Flood") {
        images.add("assets/dtypeImages/flood.png");
      } else if (data[i]['dtype'] == "Earthqauke") {
        images.add("assets/dtypeImages/earthquake.png");
      } else if (data[i]['dtype'] == "Cyclone") {
        images.add("assets/dtypeImages/cyclone.png");
      } else if (data[i]['dtype'] == "Fire Hazard") {
        images.add("assets/dtypeImages/fire.png");
      } else if (data[i]['dtype'] == "Landslide") {
        images.add("assets/dtypeImages/earthquake.png");
      } else if (data[i]['dtype'] == "Others") {
        images.add("assets/dtypeImages/others.png");
      }
      final Uint8List markIcons = await getImages(images[i], 100);
      double lat = double.parse(data[i]['lat']);
      double long = double.parse(data[i]['long']);
      //print(lat);
     // print(long);
      LatLng pos = LatLng(lat, long);
      _origin = Marker(
        markerId: MarkerId(data[i]['_id']),
        infoWindow: const InfoWindow(title: "Your location"),
        // icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        icon: BitmapDescriptor.fromBytes(markIcons),
        position: pos,
      );
      setState(() {
        markers.add(_origin);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: GoogleMap(
            mapToolbarEnabled: true,
            mapType: MapType.normal,
            initialCameraPosition: initialCameraPos,
            zoomControlsEnabled: false,
            myLocationEnabled: false,
            // ignore: non_constant_identifier_names
            onMapCreated: (Controller) => _googleMapController = Controller,
            markers: markers),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _googleMapController!
            .animateCamera(CameraUpdate.newCameraPosition(initialCameraPos)),
        child: const Icon(Icons.filter_center_focus),
      ),
    );
  }
}
