import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';

class MyLocation extends StatefulWidget {
  const MyLocation({Key? key}) : super(key: key);

  @override
  State<MyLocation> createState() => _MyLocationState();
}

class _MyLocationState extends State<MyLocation> {
  Position? _position;

  Future<void> _fetchPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: 'Location Services is disabled');
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied) {
      Fluttertoast.showToast(msg: 'You denied the permission');
      return;
    } else if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(msg: 'You denied the permission forever');
      return;
    }

    try {
      Position currentPosition = await Geolocator.getCurrentPosition();
      setState(() {
        _position = currentPosition;
      });
     // print(_position);
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error getting location: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Location'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _position == null ? 'Location' : _position.toString(),
              style: const TextStyle(fontSize: 20, color: Colors.blueGrey),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchPosition,
              child: const Text('Get Location'),
            ),
          ],
        ),
      ),
    );
  }
}
