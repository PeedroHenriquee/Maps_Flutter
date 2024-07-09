import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AeroportoPage extends StatefulWidget {
  const AeroportoPage({super.key});

  @override
  State<AeroportoPage> createState() => _AeroportoPageState();
}


class _AeroportoPageState extends State<AeroportoPage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-5.0892, -42.8016),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(-5.0892, -42.8016),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );

  final List<Marker> _markers = <Marker>[
    Marker(
      markerId: MarkerId('Aeroporto'),
      position: LatLng(-5.065373421502795, -42.822471383683705),
      infoWindow: InfoWindow(
        title: 'Aeroporto',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            markers: Set<Marker>.of(_markers),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FloatingActionButton.extended(
                onPressed: _goToTheLake,
                label: const Text('To Teresina!'),
                icon: const Icon(Icons.directions_boat),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
