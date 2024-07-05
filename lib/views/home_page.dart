import 'package:app/views/aeroporto_page.dart';
import 'package:app/views/cinema_page.dart';
import 'package:app/views/estadio_page.dart';
import 'package:app/views/hoteis_page.dart';
import 'package:app/views/p_turistico_page.dart';
import 'package:app/views/restaurante_page.dart';
import 'package:app/views/teatro_page.dart';
import 'package:app/widgets/menu_item.dart';
import 'package:flutter/material.dart';
import 'shop_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Guia Turistico In Terehell'),
            const SizedBox(width: 10),
            Image.asset(
              'images/turista.png',
              width: 40,
              height: 40,
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // Navegação para a tela Home
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Sobre'),
              onTap: () {
                // Navegação para a tela Sobre
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail),
              title: const Text('Contato'),
              onTap: () {
                // Navegação para a tela Contato
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MenuItem(
              iconPath: 'images/travel.png',
              label: 'Shoppings',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShoppingPage()),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MenuItem(
              iconPath: 'images/cinema.png',
              label: 'Cinemas',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CinemaPage()),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MenuItem(
              iconPath: 'images/futebol.png',
              label: 'Estadios',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapSample()),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MenuItem(
              iconPath: 'images/hoteis.png',
              label: 'Hotéis',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HotelPage()),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MenuItem(
              iconPath: 'images/restaurantes.png',
              label: 'Restaurantes',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RestaurantePage()),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MenuItem(
              iconPath: 'images/aviao.png',
              label: 'Aeroportos',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AeroportoPage()),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MenuItem(
              iconPath: 'images/pontes.png',
              label: 'Pontos Turisticos',
              onTap: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>TuristicoPage()),
                );},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MenuItem(
              iconPath: 'images/teatro.png',
              label: 'Teatros',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TeatroPage()),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }
}
