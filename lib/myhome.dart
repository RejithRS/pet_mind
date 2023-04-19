import 'package:flutter/material.dart';
import 'package:pet_mind/petfoods.dart';
import 'package:pet_mind/screens/home/home_screen.dart';
import 'package:pet_mind/screens/doc_screen.dart';
import 'package:pet_mind/search.dart';

import 'cart.dart';
import 'screens/doc_screen.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key, required Map<String, dynamic> snap});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  // ignore: prefer_final_fields
  static  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    doctScreen(),
    FirebaseSearchScreen(),
    //CartPage(cartItems: const [],),
    // Text(
    //   'Settings',
    //   style: optionStyle,
    // ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Shopping',
            backgroundColor: Colors.grey,
            
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'Pet Care',
            backgroundColor: Colors.grey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel),
            label: 'Cart',
            backgroundColor: Colors.grey,
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.settings),
          //   label: 'Settings',
          //   backgroundColor: Colors.grey,
          // ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 0, 0, 0),
        onTap: _onItemTapped,
      ),
    );
  }
}
