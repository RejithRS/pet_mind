import 'package:flutter/material.dart';

class PetFilterPage extends StatefulWidget {
  @override
  _PetFilterPageState createState() => _PetFilterPageState();
}

class _PetFilterPageState extends State<PetFilterPage> {
  bool _isDogSelected = true;
  bool _isCatSelected = true;
  bool _isBirdSelected = true;
  bool _isSmallSelected = true;
  bool _isMediumSelected = true;
  bool _isLargeSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter Pets'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Pet Type',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          CheckboxListTile(
            title: Text('Dogs'),
            value: _isDogSelected,
            onChanged: (value) {
              setState(() {
                _isDogSelected = value!;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Cats'),
            value: _isCatSelected,
            onChanged: (value) {
              setState(() {
                _isCatSelected = value!;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Birds'),
            value: _isBirdSelected,
            onChanged: (value) {
              setState(() {
                _isBirdSelected = value!;
              });
            },
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Pet Size',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          CheckboxListTile(
            title: Text('Small'),
            value: _isSmallSelected,
            onChanged: (value) {
              setState(() {
                _isSmallSelected = value!;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Medium'),
            value: _isMediumSelected,
            onChanged: (value) {
              setState(() {
                _isMediumSelected = value!;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Large'),
            value: _isLargeSelected,
            onChanged: (value) {
              setState(() {
                _isLargeSelected = value!;
              });
            },
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Apply filters and close page
                  Navigator.of(context).pop();
                },
                child: Text('Apply Filters'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
