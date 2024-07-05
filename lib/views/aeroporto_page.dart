import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AeroportoPage extends StatefulWidget {
  @override
  _AeroportoPageState createState() => _AeroportoPageState();
}

class _AeroportoPageState extends State<AeroportoPage> {
  Completer<GoogleMapController> _controller = Completer();

  // Exemplo de dados dos aeroportos em Teresina
  List<Map<String, dynamic>> aeroportos = [
    {
      'nome': 'Aeroporto de Teresina/Senador Petrônio Portella',
      'latitude': -5.061341,
      'longitude': -42.820557,
    },
    // Adicione mais aeroportos conforme necessário
  ];

  Set<Marker> _markers = Set();

  @override
  void initState() {
    super.initState();
    // Criar marcadores para cada aeroporto
    _markers = aeroportos.map((aeroporto) {
      return Marker(
        markerId: MarkerId(aeroporto['nome']),
        position: LatLng(aeroporto['latitude'], aeroporto['longitude']),
        infoWindow: InfoWindow(
          title: aeroporto['nome'],
        ),
      );
    }).toSet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aeroportos em Teresina'),
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
