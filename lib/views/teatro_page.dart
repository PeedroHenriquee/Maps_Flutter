import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TeatroPage extends StatefulWidget {
  @override
  _TeatrosPageState createState() => _TeatrosPageState();
}

class _TeatrosPageState extends State<TeatroPage> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = Set();

  // Exemplo de dados de teatros em Teresina
  List<Map<String, dynamic>> teatros = [
    {
      'nome': 'Teatro 4 de Setembro',
      'latitude': -5.093116,
      'longitude': -42.801977,
    },
    {
      'nome': 'Teatro João Paulo II',
      'latitude': -5.077226,
      'longitude': -42.814634,
    },
    // Adicione mais teatros conforme necessário
  ];

  @override
  void initState() {
    super.initState();
    // Criar marcadores para cada teatro
    _markers = teatros.map((teatro) {
      return Marker(
        markerId: MarkerId(teatro['nome']),
        position: LatLng(teatro['latitude'], teatro['longitude']),
        infoWindow: InfoWindow(
          title: teatro['nome'],
        ),
      );
    }).toSet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teatros em Teresina'),
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
