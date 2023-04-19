import 'package:flutter/material.dart';

class ItemForm extends StatefulWidget {
  final Function onSubmit;
  final String? name;
  final double? price;

  ItemForm({required this.onSubmit, this.name, this.price});

  @override
  _ItemFormState createState() => _ItemFormState();
}

class _ItemFormState extends State<ItemForm> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late double _price;

  @override
  void initState() {
    super.initState();
    _name = widget.name ?? '';
    _price = widget.price ?? 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            initialValue: _name,
            decoration: InputDecoration(
              labelText: 'Name',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a name';
              }
              return null;
            },
            onSaved: (value) {
              _name = value!;
            },
          ),
          TextFormField(
            initialValue: _price.toString(),
            decoration: InputDecoration(
              labelText: 'Price',
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a price';
              }
              try {
                double.parse(value);
              } catch (_) {
                return 'Please enter a valid price';
              }
              return null;
            },
            onSaved: (value) {
              _price = double.parse(value!);
            },
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                widget.onSubmit(_name, _price);
                Navigator.pop(context);
              }
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
}

class ItemScreen extends StatefulWidget {
  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  List<Map<String, dynamic>> _items = [
    {'name': 'Item 1', 'price': 10.0},
    {'name': 'Item 2', 'price': 20.0},
    {'name': 'Item 3', 'price': 30.0},
  ];

  void _addItem(String name, double price) {
    setState(() {
      _items.add({'name': name, 'price': price});
    });
  }

  void _updateItem(int index, String name, double price) {
    setState(() {
      _items[index]['name'] = name;
      _items[index]['price'] = price;
    });
  }

  void _showAddItemDialog() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Item'),
          content: ItemForm(onSubmit: _addItem),
        );
      },
    );
  }

  void _showUpdateItemDialog(int index) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Update Item'),
          content: ItemForm(
            onSubmit: (name, price) => _updateItem(index, name, price),
            name: _items[index]['name'],
            price: _items[index]['price'],
          ),
        );
      },
   
    );}
    


  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}