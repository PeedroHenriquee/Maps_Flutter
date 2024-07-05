import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CinemaPage extends StatefulWidget {
  @override
  _CinemaPageState createState() => _CinemaPageState();
}

class _CinemaPageState extends State<CinemaPage> {
  Completer<GoogleMapController> _controller = Completer();

  // Exemplo de dados dos cinemas em Teresina
  List<Map<String, dynamic>> cinemas = [
    {
      'nome': 'Cinemas Teresina',
      'latitude': -5.081155,
      'longitude': -42.793581,
    },
    // Adicione mais cinemas conforme necessário
  ];

  Set<Marker> _markers = Set();

  @override
  void initState() {
    super.initState();
    // Criar marcadores para cada cinema
    _markers = cinemas.map((cinema) {
      return Marker(
        markerId: MarkerId(cinema['nome']),
        position: LatLng(cinema['latitude'], cinema['longitude']),
        infoWindow: InfoWindow(
          title: cinema['nome'],
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
      );
    }).toSet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cinemas em Teresina'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(-5.0892, -42.8015), // Posição inicial do mapa (centro de Teresina)
          zoom: 12,
        ),
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
