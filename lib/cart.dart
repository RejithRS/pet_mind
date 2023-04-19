import 'package:flutter/material.dart';

import 'package:pet_mind/models/product.dart';

class CartPage extends StatefulWidget {
  final List<Product> cartItems;

  CartPage({required this.cartItems});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double _totalPrice = 0;

  @override
  void initState() {
    super.initState();

    // Calculate total price of items in cart
    widget.cartItems.forEach((item) {
      _totalPrice += item.price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: widget.cartItems.length,
          //     itemBuilder: (context, index) {
          //       return ListTile(
          //         leading: Image.asset(widget.cartItems[index].image),
          //         title: Text(widget.cartItems[index].title),
          //         trailing: Text('\$${widget.cartItems[index].price.toStringAsFixed(2)}'),
          //       );
          //     },
          //   ),
          // ),
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.grey[300],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Total:',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  '\$${_totalPrice.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Implement checkout process
                  // ...
                  // Remove items from cart
                  widget.cartItems.clear();
                  setState(() {
                    _totalPrice = 0;
                  });
                  // Navigate back to pet list screen
                  Navigator.of(context).pop();
                },
                child: Text('Checkout'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
