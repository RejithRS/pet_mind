import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_mind/account.dart';
import 'package:pet_mind/login.dart';

import 'myhome.dart';


class UserCheck extends StatelessWidget {
  const UserCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print('login');
            return HomePage();
          } else {
            print('no huh');
            return const MyLogin();
          }
        },
      ),
    );
  }
}
