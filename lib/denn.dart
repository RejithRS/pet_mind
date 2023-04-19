// // ignore_for_file: prefer_const_constructors
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:pet_mind/auth/auth_methods.dart';
// import 'package:medical/screens/login.dart';

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
//                 padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
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
//                       height: 50,
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
//                                 name: _nameController.text.trim());
//                             Navigator.of(context).pushReplacement(
//                                 MaterialPageRoute(
//                                     builder: (_) => LoginScreen()));
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

// // Future signupUser() async{
// //   showDialog(
// //     context: context,
// //     barrierDismissible: false, 
// //     builder: (context)=>Center(child: CircularProgressIndicator));
// //   try{
   
// //     var email;
// //     var password;
// //     await FirebaseAuth.instance.createUserWithEmailAndPassword
// //     (email: email.text.trim(),
// //      password: password.text.trim());
// //   } on FirebaseAuth catch(e){
// //     print(e);
// //   }
// //   Navigator.of(context as BuildContext)
// //           .pushReplacement(MaterialPageRoute(builder: (_) => MyStatefulWidget()));
// // }




// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';

// class myRegister extends StatefulWidget {
//   const myRegister({Key? key}) : super(key: key);

//   @override
//   _myRegisterState createState() => _myRegisterState();
// }

// class _myRegisterState extends State<myRegister> {
//   //Password Field obscureText  Handler
//   bool _isHidden = true;
//   void _toggleVisibility() {
//     setState(() {
//       _isHidden = !_isHidden;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(
//               'assets/login.png',
//             ),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Scaffold(
//           appBar: AppBar(
//               elevation: null,
//               backgroundColor: Colors.transparent,
//               leading: TextButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, 'login');
//                 },
//                 child: Icon(
//                   Icons.arrow_back_ios_rounded,
//                   color: Colors.white,
//                 ),
//               )),
//           backgroundColor: Colors.transparent,
//           body: Stack(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'REGISTER\n NOW',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 40.0,
//                     ),
//                   ),
//                 ],
//               ),
//               SingleChildScrollView(
//                 child: Container(
//                   padding: EdgeInsets.only(
//                     top: MediaQuery.of(context).size.height * 0.28,
//                     left: 35,
//                     right: 35,
//                   ),
//                   child: Column(
//                     children: [
//                       TextField(
//                         decoration: InputDecoration(
//                           labelText: 'Username',
//                           fillColor: Colors.transparent,
//                           filled: true,
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10.0),
//                               borderSide: const BorderSide(
//                                 color: Colors.white,
//                               )),
//                         ),
//                       ),
//                       SizedBox(height: 30.0),
//                       TextField(
//                         decoration: InputDecoration(
//                           fillColor: Colors.transparent,
//                           prefixIcon: Icon(Icons.email_outlined),
//                           filled: true,
//                           labelText: 'Email',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                             borderSide: BorderSide(
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 30.0),
//                       TextField(
//                         decoration: InputDecoration(
//                           fillColor: Colors.transparent,
//                           prefixIcon: Icon(Icons.phone),
//                           filled: true,
//                           labelText: 'Phone',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                             borderSide: const BorderSide(
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 30.0),
//                       TextField(
//                         obscureText: _isHidden,
//                         decoration: InputDecoration(
//                           fillColor: Colors.transparent,
//                           prefixIcon: Icon(Icons.lock),
//                           suffixIcon: IconButton(
//                             onPressed: _toggleVisibility,
//                             icon: _isHidden
//                                 ? Icon(Icons.visibility)
//                                 : Icon(Icons.visibility_off),
//                           ),
//                           filled: true,
//                           labelText: 'Password',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                             borderSide: const BorderSide(
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 30.0),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 maximumSize: const Size(170.0, 90.0),
//                                 minimumSize: const Size(170.0, 60.0),
//                                 primary: Colors.black,
//                                 shape: const StadiumBorder(),
//                               ),
//                               onPressed: () {},
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 //crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Text('REGISTER'),
//                                   Icon(
//                                     Icons.content_paste_rounded,
//                                     color: Colors.white,
//                                   ),
//                                 ],
//                               )),
//                         ],
//                       ),
//                       SizedBox(height: 30.0),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           TextButton(
//                             onPressed: () {
//                               Navigator.pushNamed(context, 'login');
//                             },
//                             child: Text(
//                               'Login',
//                               style: TextStyle(color: Colors.black),
//                             ),
//                           ),
//                           TextButton(
//                             onPressed: () {
//                               Navigator.pushNamed(context, 'forgot');
//                             },
//                             child: Text(
//                               'Forgot password?',
//                               style: TextStyle(color: Colors.black),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // final user = User(
// //                                             name=_nameController.text,
// //                                             email=_emailController.text,
// //                                             phone=int.parse(_phoneController.text)
// //                                             pass=_passwordController.text,
// //                                             confirmpass=_confirmpassController.text,

// //                                           );
// //                                           createUser(user);

// //                                           Navigator.pop(context);


// //         Future createUser(User user)async{
  
// //   final docUser = FirebaseFirestore.instance.collection('users').doc();
// //   user.id=docUser.id;

// //   final json = user.toJson();
// //   await docUser.set(json);
// //   }
  
// //   class FirebaseFirestore {
// //   }                                   

// AuthMethods().signupUser(
//                                             name: _nameController.text.trim(),
//                                             email: _emailController.text.trim(),
//                                             phone: _phoneController.text.trim(),
//                                             password: _passwordController.text.trim(),
//                                 );
                                
                               
                                
//                             Navigator.of(context).pushReplacement(
//                                 MaterialPageRoute(
//                                     builder: (_) => MyLogin()));