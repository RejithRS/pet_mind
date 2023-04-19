
import 'package:flutter/material.dart';

import 'auth.dart';
import 'constants.dart';
import 'login.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});
  void signOutUser() async {
    await AuthMethods().signOut();
    
  }

  @override
  // ignore: library_private_types_in_public_api
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  bool _showOnboarding = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: defaultPadding / 2),
            Text(
              "Settings",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Notifications',),
            value: _notificationsEnabled,
            onChanged: (value) {
              setState(() {
                _notificationsEnabled = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: _darkModeEnabled,
            onChanged: (value) {
              setState(() {
                _darkModeEnabled = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Show Onboarding'),
            value: _showOnboarding,
            onChanged: (value) {
              setState(() {
                _showOnboarding = value;
              });
            },
          ),
          ListTile(
            title: const Text('About'),
            onTap: () {
              // Navigate to the about page
            },
          ),
          ListTile(
            title: const Text('Help centre'),
            onTap: () {
              
            },
          ),
          ListTile(
            title: const Text('Privacy policy'),
            onTap: () {
              
            },
          ),

          ListTile(
            title: const Text('Terms of Use'),
            onTap: () {
              // Perform logout operation
            },
          ),
          ListTile(
            title: const Text('Logout'),
            onTap: () {
              // Perform logout operation
              Navigator.of(context).pop();
  Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => MyLogin()));
                    signOutUser();
            },
          ),
        ],
      ),
    );
  }
  
  void signOutUser() {}
  
}
