
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatelessWidget {
  final String email = 'petshope@example.com';
  final String phone = '555-1234-255';
  final String address = '123 Main St, Anytown INDIA';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.email),
            title: Text(email),
            onTap: () => launchUrl('mailto:$email' as Uri),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text(phone),
            onTap: () => launchUrl('tel:$phone' as Uri),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text(address),
            onTap: () => launchUrl('https://www.google.com/maps/place/$address' as Uri),
          ),
        ],
      ),
    );
  }
}
