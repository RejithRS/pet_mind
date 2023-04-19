import 'package:flutter/material.dart';

class PetFoodPage extends StatefulWidget {
  const PetFoodPage({super.key});

  @override
  _PetFoodPageState createState() => _PetFoodPageState();
}

class _PetFoodPageState extends State<PetFoodPage> {
  int _selectedQuantity = 1;
  double _totalPrice = 10.0;

  void _incrementQuantity() {
    setState(() {
      _selectedQuantity++;
      _totalPrice = _selectedQuantity * 10.0;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_selectedQuantity > 1) {
        _selectedQuantity--;
        _totalPrice = _selectedQuantity * 10.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Food'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.all(16.0),
            child: Text(
              'Premium Cat Food',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Quantity:',
                  style: TextStyle(fontSize: 18.0),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: _decrementQuantity,
                    ),
                    Text(
                      '$_selectedQuantity',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: _incrementQuantity,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(16.0),
            child: Text(
              'Total: \$$_totalPrice',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(16.0),
            child: RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text('Buy Now'),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
  
  // ignore: non_constant_identifier_names
  RaisedButton({required MaterialColor color, required Color textColor, required Text child, required Null Function() onPressed}) {}
}



