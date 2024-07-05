import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RestaurantePage extends StatefulWidget {
  @override
  _RestaurantePageState createState() => _RestaurantePageState();
}

class _RestaurantePageState extends State<RestaurantePage> {
  Completer<GoogleMapController> _controller = Completer();

  // Exemplo de dados dos restaurantes em Teresina
  List<Map<String, dynamic>> restaurantes = [
    {
      'nome': 'Restaurante A',
      'latitude': -5.088,
      'longitude': -42.801,
    },
    {
      'nome': 'Restaurante B',
      'latitude': -5.09,
      'longitude': -42.796,
    },
    // Adicione mais restaurantes conforme necessário
  ];

  Set<Marker> _markers = Set();

  @override
  void initState() {
    super.initState();
    // Criar marcadores para cada restaurante
    _markers = restaurantes.map((restaurante) {
      return Marker(
        markerId: MarkerId(restaurante['nome']),
        position: LatLng(restaurante['latitude'], restaurante['longitude']),
        infoWindow: InfoWindow(
          title: restaurante['nome'],
        ),
      );
    }).toSet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurantes em Teresina'),
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
