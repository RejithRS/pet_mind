// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_mind/login.dart';

import 'auth.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpassController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String selectedRadioButton = 'User';
  
  

  // List of items in our dropdown menu

   bool passwordSame() {
    if (_passwordController.text.trim() == _confirmpassController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  Future signUp() async {
    if (passwordSame()) {
      UserCredential credentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim());
    }
  }

    @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/a.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 60.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 35, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'CREATE\nACCOUNT',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 33),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.0001),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 35, right: 35),
                          child: Column(
                            children: [
                              TextField(
                                controller: _nameController,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0)),
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(18),
                                        borderSide: BorderSide.none),
                                    hintText: "Name",
                                    hintStyle: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                    fillColor: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.8),
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    )),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextField(
                                controller: _emailController,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0)),
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(18),
                                        borderSide: BorderSide.none),
                                    hintText: "Email",
                                    hintStyle: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                    fillColor: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.8),
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    )),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextField(
                                controller: _phoneController,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0)),
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(18),
                                        borderSide: BorderSide.none),
                                    hintText: "Phone",
                                    hintStyle: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                    fillColor: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.8),
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    )),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextField(
                                controller: _passwordController,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0)),
                                obscureText: true,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(18),
                                        borderSide: BorderSide.none),
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                    fillColor: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.8),
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    )),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextField(
                                controller: _confirmpassController,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0)),
                                obscureText: true,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(18),
                                        borderSide: BorderSide.none),
                                    hintText: "Confirm Password",
                                    hintStyle: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                    fillColor: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.8),
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    )),
                              ),
                              Container(
                      height: 70,
                      width: 300,
                      child: Row(
                        children: [
                          Flexible(
                            child: RadioListTile(
                                value: 'User',
                                title: Text(
                                  'User',
                                ),
                                activeColor: Color.fromARGB(255, 223, 98, 96),
                                groupValue: selectedRadioButton,
                                selectedTileColor: Color.fromARGB(255, 223, 98, 96),
                                onChanged: (value) {
                                  setState(() {
                                    selectedRadioButton = 'Patient';
                                  });
                                }),
                          ),
                          Flexible(
                            child: RadioListTile(
                                value: 'Doctor',
                                title: Text(
                                  'Doctor',
                                ),
                                activeColor: Color.fromARGB(255, 223, 98, 96),
                                groupValue: selectedRadioButton,
                                onChanged: (value) {
                                  setState(() {
                                    selectedRadioButton = 'Doctor';
                                  });
                                }),
                          ),
                        
                          Flexible(
                            child: RadioListTile(
                                value: 'Shopper',
                                title: Text(
                                  'Shopper',
                                ),
                                activeColor: Color.fromARGB(255, 223, 98, 96),
                                groupValue: selectedRadioButton,
                                onChanged: (value) {
                                  setState(() {
                                    selectedRadioButton = 'Shopper';
                                  });
                                }),
                          )
                        ],
                      ),
                    ),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 60.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                       shadowColor: Colors.red[300],
                        color: Color.fromARGB(255, 223, 98, 96),
                        elevation: 0,
                        child: GestureDetector(
                          onTap: () {
                            // signUp();
                            AuthMethods().signupUser(
                                type: selectedRadioButton,
                                email: _emailController.text.trim(),
                                password: _passwordController.text.trim(),
                                name: _nameController.text.trim(),
                                phone: _phoneController.text.trim());

                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (_) => MyLogin()));
                          },
                          child: Center(
                            child: Text(
                              'SIGNUP',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      height: 60.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        shadowColor: Colors.red[300],
                        color: Color.fromARGB(255, 223, 98, 96),
                        elevation: 0,
                        child: GestureDetector(
                          onTap: () {
                            // signin();
                            Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => MyLogin()));
                          },
                          child: Center(
                            child: Text(
                              'SIGNIN',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// //import 'package:pet_mind/auth/auth_methods.dart';
// import 'package:pet_mind/login.dart';

// import 'auth.dart';

// class SignupScreen extends StatefulWidget {
//   const SignupScreen({Key? key}) : super(key: key);

//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _confirmPassword = TextEditingController();
//   final _nameController = TextEditingController();
//   final _phoneController = TextEditingController();
//   String selectedRadioButton = 'User';

//   bool passwordSame() {
//     if (_passwordController.text.trim() == _confirmPassword.text.trim()) {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   Future signUp() async {
//     if (passwordSame()) {
//       UserCredential credentials = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(
//               email: _emailController.text.trim(),
//               password: _passwordController.text.trim());
//     }
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     _confirmPassword.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//         // resizeToAvoidBottomInset: false,
//         body: Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10.0),
//       child: SingleChildScrollView(
//         child: Padding(
//           padding:
//               const EdgeInsets.only(top: 28.0, left: 10, right: 10, bottom: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
                
//                 child: Text(
//                   'Join',
//                   style: TextStyle(
//                     fontSize: 60.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               Row(
//                 children: [
//                   Container(
//                     child: Text(
//                       'Us',
//                       style: TextStyle(
//                         fontSize: 60.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     child: Text(
//                       '.',
//                       style: TextStyle(
//                           fontSize: 60.0,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.blue),
//                     ),
//                   ),
//                 ],
//               ),
//               Container(
                
//                 padding: EdgeInsets.only(top: 25.0, left: 10.0, right: 10.0),
//                 child: Column(
//                   // ignore: prefer_const_literals_to_create_immutables
//                   children: [
//                     TextField(
//                       controller: _nameController,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'name',
//                         labelStyle: TextStyle(
//                             fontWeight: FontWeight.bold, color: Colors.grey),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     TextField(
//                       controller: _emailController,
//                       keyboardType: TextInputType.emailAddress,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'email',
//                         labelStyle: TextStyle(
//                             fontWeight: FontWeight.bold, color: Colors.grey),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     TextField(
//                       controller: _phoneController,
//                       keyboardType: TextInputType.phone,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'Phone',
//                         labelStyle: TextStyle(
//                             fontWeight: FontWeight.bold, color: Colors.grey),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     TextField(
//                       obscureText: true,
//                       controller: _passwordController,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10.0)),
//                         labelText: 'password',
//                         labelStyle: TextStyle(
//                             fontWeight: FontWeight.bold, color: Colors.grey),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     TextField(
//                       obscureText: true,
//                       controller: _confirmPassword,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10.0)),
//                         labelText: 'confirm password',
//                         labelStyle: TextStyle(
//                             fontWeight: FontWeight.bold, color: Colors.grey),
//                       ),
//                     ),
//                     Container(
//                       height: 70,
//                       width: 300,
//                       child: Row(
//                         children: [
//                           Flexible(
//                             child: RadioListTile(
//                                 value: 'User',
//                                 title: Text(
//                                   'User',
//                                 ),
//                                 activeColor: Color(0xFFC31DC7),
//                                 groupValue: selectedRadioButton,
//                                 selectedTileColor: Color(0xFFC31DC7),
//                                 onChanged: (value) {
//                                   setState(() {
//                                     selectedRadioButton = 'Patient';
//                                   });
//                                 }),
//                           ),
//                           Flexible(
//                             child: RadioListTile(
//                                 value: 'Doctor',
//                                 title: Text(
//                                   'Doctor',
//                                 ),
//                                 activeColor: Color(0xFFC31DC7),
//                                 groupValue: selectedRadioButton,
//                                 onChanged: (value) {
//                                   setState(() {
//                                     selectedRadioButton = 'Doctor';
//                                   });
//                                 }),
//                           ),
                        
//                           Flexible(
//                             child: RadioListTile(
//                                 value: 'Shopper',
//                                 title: Text(
//                                   'Shopper',
//                                 ),
//                                 activeColor: Color(0xFFC31DC7),
//                                 groupValue: selectedRadioButton,
//                                 onChanged: (value) {
//                                   setState(() {
//                                     selectedRadioButton = 'Shopper';
//                                   });
//                                 }),
//                           )
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     SizedBox(
//                       height: 60.0,
//                       child: Material(
//                         borderRadius: BorderRadius.circular(10.0),
//                         shadowColor: Colors.blueAccent,
//                         color: Colors.blue,
//                         elevation: 0,
//                         child: GestureDetector(
//                           onTap: () {
//                             // signUp();
//                             AuthMethods().signupUser(
//                                 type: selectedRadioButton,
//                                 email: _emailController.text.trim(),
//                                 password: _passwordController.text.trim(),
//                                 name: _nameController.text.trim(),
//                                 phone: _phoneController.text.trim());

//                             Navigator.of(context).pushReplacement(
//                                 MaterialPageRoute(
//                                     builder: (_) => MyLogin()));
//                           },
//                           child: Center(
//                             child: Text(
//                               'SIGNUP',
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20.0,
//                     ),
//                     SizedBox(
//                       height: 60.0,
//                       child: Material(
//                         borderRadius: BorderRadius.circular(10.0),
//                         shadowColor: Colors.blueAccent,
//                         color: Colors.blue,
//                         elevation: 0,
//                         child: GestureDetector(
//                           onTap: () {
//                             // signin();
//                             Navigator.of(context)
//           .pushReplacement(MaterialPageRoute(builder: (_) => MyLogin()));
//                           },
//                           child: Center(
//                             child: Text(
//                               'SIGNIN',
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20.0,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ));
//   }
// }

