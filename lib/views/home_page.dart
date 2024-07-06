import 'package:app/views/aeroporto_page.dart';
import 'package:app/views/cinema_page.dart';
import 'package:app/views/contato.dart';
import 'package:app/views/estadio_page.dart';
import 'package:app/views/hoteis_page.dart';
import 'package:app/views/p_turistico_page.dart';
import 'package:app/views/restaurante_page.dart';
import 'package:app/views/sobre.dart';
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
  TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _items = [
    {
      'label': 'Shoppings',
      'iconPath': 'images/travel.png',
      'page': 'ShoppingPage'
    },
    {'label': 'Cinemas', 'iconPath': 'images/cinema.png', 'page': 'CinemaPage'},
    {
      'label': 'Estadios',
      'iconPath': 'images/futebol.png',
      'page': 'MapSample'
    },
    {'label': 'Hotéis', 'iconPath': 'images/hoteis.png', 'page': 'HotelPage'},
    {
      'label': 'Restaurantes',
      'iconPath': 'images/restaurantes.png',
      'page': 'RestaurantePage'
    },
    {
      'label': 'Aeroportos',
      'iconPath': 'images/aviao.png',
      'page': 'AeroportoPage'
    },
    {
      'label': 'Pontos Turisticos',
      'iconPath': 'images/pontes.png',
      'page': 'TuristicoPage'
    },
    {'label': 'Teatros', 'iconPath': 'images/teatro.png', 'page': 'TeatroPage'},
  ];
  late List<Map<String, String>> _filteredItems;

  @override
  void initState() {
    super.initState();
    _filteredItems = _items;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        _filteredItems = _items;
      }
      if (index == 1) {
        _showSearchDialog();
      }
    });
  }

  void _showSearchDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Search'),
          content: TextField(
            controller: _searchController,
            decoration: InputDecoration(hintText: "Search..."),
            onChanged: _filterItems,
          ),
          actions: [
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _filterItems(String query) {
    setState(() {
      _filteredItems = _items.where((item) {
        return item['label']!.toLowerCase().contains(query.toLowerCase());
      }).toList();
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
              width: 20,
              height: 20,
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
                _onItemTapped(0);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Sobre'),
              onTap: () {
                // Navegação para a tela Sobre
          
                Navigator.pop(context); // Fecha o drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SobrePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail),
              title: const Text('Contato'),
              onTap: () {
                // Navegação para a tela Contato
                Navigator.pop(context); // Fecha o drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContatoPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        children: _filteredItems.map((item) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: MenuItem(
              iconPath: item['iconPath']!,
              label: item['label']!,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    switch (item['page']) {
                      case 'ShoppingPage':
                        return ShoppingPage();
                      case 'CinemaPage':
                        return CinemaPage();
                      case 'MapSample':
                        return MapSample();
                      case 'HotelPage':
                        return HotelPage();
                      case 'RestaurantePage':
                        return RestaurantePage();
                      case 'AeroportoPage':
                        return AeroportoPage();
                      case 'TuristicoPage':
                        return TuristicoPage();
                      case 'TeatroPage':
                        return TeatroPage();
                      default:
                        return Container();
                    }
                  }),
                );
              },
            ),
          );
        }).toList(),
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
