import 'package:flutter/material.dart';

class HotelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shoppings'),
      ),
      body: Center(
        child: Text(
          'Bem-vindo à página de Shoppings!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
