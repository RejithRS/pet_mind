import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pet_mind/login.dart';
import 'package:pet_mind/register.dart';
import 'package:pet_mind/intro.dart';
import 'package:pet_mind/myhome.dart';
import 'package:pet_mind/screens/home/home_screen.dart';

import 'forgot.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The pet shop',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        fontFamily: "Gordita",
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black),
        ),
      ),
      home: OnBoardingScreen(),
      routes: {
       'register': (context) => MyRegister(),
       'login': (context) => MyLogin(),
       'forgot': (context) => resetPassword(),
       //'home_screen': (context) => HomeScreen(),
       //'myhome':(context)=> MyStatefulWidget(),
     }
    );
  }
}



