import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TuristicoPage extends StatefulWidget {
  @override
  _TuristicoPageState createState() => _TuristicoPageState();
}

class _TuristicoPageState extends State<TuristicoPage> {
  Completer<GoogleMapController> _controller = Completer();

  // Exemplo de dados dos pontos turísticos em Teresina
  List<Map<String, dynamic>> pontosTuristicos = [
    {
      'nome': 'Parque Ambiental Encontro dos Rios',
      'latitude': -5.0642,
      'longitude': -42.7914,
    },
    {
      'nome': 'Parque Zoobotânico',
      'latitude': -5.0753,
      'longitude': -42.7992,
    },
    // Adicione mais pontos turísticos conforme necessário
  ];

  Set<Marker> _markers = Set();

  @override
  void initState() {
    super.initState();
    // Criar marcadores para cada ponto turístico
    _markers = pontosTuristicos.map((pontoTuristico) {
      return Marker(
        markerId: MarkerId(pontoTuristico['nome']),
        position: LatLng(pontoTuristico['latitude'], pontoTuristico['longitude']),
        infoWindow: InfoWindow(
          title: pontoTuristico['nome'],
        ),
      );
    }).toSet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pontos Turísticos em Teresina'),
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
