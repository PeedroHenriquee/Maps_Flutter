import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShoppingPage extends StatefulWidget {
  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  Completer<GoogleMapController> _controller = Completer();

  // Exemplo de dados dos shoppings em Teresina
  List<Map<String, dynamic>> shoppings = [
    {
      'nome': 'Shopping Rio Poty',
      'latitude': -5.092147,
      'longitude': -42.799895,
    },
    {
      'nome': 'Shopping Teresina',
      'latitude': -5.085361,
      'longitude': -42.791527,
    },
    // Adicione mais shoppings conforme necessário
  ];

  Set<Marker> _markers = Set();

  @override
  void initState() {
    super.initState();
    // Criar marcadores para cada shopping
    _markers = shoppings.map((shopping) {
      return Marker(
        markerId: MarkerId(shopping['nome']),
        position: LatLng(shopping['latitude'], shopping['longitude']),
        infoWindow: InfoWindow(
          title: shopping['nome'],
        ),
      );
    }).toSet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shoppings em Teresina'),
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
