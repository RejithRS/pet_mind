import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'account.dart';
import 'auth.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool isFading = true;
  bool _isLoading = false;

  void login() async {
    setState(() {
      _isLoading = true;
    });

    String res = await AuthMethods()
        .loginUser(email: email.text, password: password.text);
    if (res == 'success') {
      final user = FirebaseAuth.instance.currentUser!;
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
    } else {}
    setState(() {
      _isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/a.jpg'), fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Container(),
              Container(
                padding: EdgeInsets.only(left: 35, top: 130),
                child: Text(
                  'WELCOME\nBACK',
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 33),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.38),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 35, right: 35),
                        child: Column(
                          children: [
                            TextField(
                              controller: email,
                              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    borderSide: BorderSide.none
                                    
                                  ),
                      
                                  hintText: "Email",
                                  hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                                  fillColor: Theme.of(context).primaryColor.withOpacity(0.8),
                                  filled: true,
                                  
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  )),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextField(
                              controller: password,
                              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                              obscureText: true,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    borderSide: BorderSide.none
                                  ),
                                  
                                  fillColor: Theme.of(context).primaryColor.withOpacity(0.8),
                                  filled: true,
    
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  )),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                               _isLoading? CircularProgressIndicator(): Text(
                                  'SIGN IN',
                                  style: TextStyle(
                                      fontSize: 27, fontWeight: FontWeight.w700),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Color.fromARGB(255, 223, 98, 96),
                                  child: IconButton(
                                      color: Colors.white,
                                      onPressed: () {
                                        login();
                                      },
                                      icon: Icon(
                                        Icons.arrow_forward,
                                      )),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'register');
                                  },
                                  child: Text(
                                    'SIGN UP',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 18),
                                  ),
                                  style: ButtonStyle(),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, 'forgot');
                                    },
                                    child: Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 18,
                                      ),
                                    )),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




