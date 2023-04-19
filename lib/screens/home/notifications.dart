import 'package:flutter/material.dart';

class notification extends StatelessWidget {
  const notification({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        leading: const BackButton(color: Colors.black),
      ),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: CircleAvatar(
        //       backgroundColor: Colors.white,
             
        //     ),
        //   )
        // ],
      body: Center(
        child: Text(
          'No noftifications.',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      );
    
  }
}