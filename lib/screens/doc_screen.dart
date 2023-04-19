import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_mind/screens/component/category_card.dart';
import 'package:pet_mind/screens/component/doctor_card.dart';
import 'package:pet_mind/screens/component/search_bar.dart';
import 'package:pet_mind/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import '../constants.dart';
import '../navigation_drawer.dart';
import 'home/notifications.dart';

class doctScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
  
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           // SvgPicture.asset("assets/icons/Location.svg"),
            const SizedBox(width: defaultPadding / 2),
            Text(
              "PET SHOPPE",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset("assets/icons/Notification.svg"),
            onPressed: () {
              Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const notification()));
              
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 30),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: <Widget>[
              //       SvgPicture.asset('assets/icons/doc/menu.svg'),
              //       SvgPicture.asset('assets/icons/doc/profile.svg'),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 50,
              // ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 30),
                //child:
                 Text(
                  'Find Your Desired\nDoctor',
                 style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.w500,
                   color: Colors.black),
            ),
              //),
              // SizedBox(
              //   height: 20,
              // ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: defaultPadding),
                child: SearchBar(),
              ),
              // SizedBox(
              //   height: 20,
              // ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 30),
              //   child: Text(
              //     'Categories',
              //     style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //       color: kTitleTextColor,
              //       fontSize: 18,
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              //buildCategoryList(),
              // SizedBox(
              //   height: 20,
              // ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 95),
                child: Text(
                  'Top Doctors',
                  style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(height: 200,child: buildDoctorList(),)
            ],
          ),
        ),
      );
    //);
  }

  // buildCategoryList() {
  //   return SingleChildScrollView(
  //     scrollDirection: Axis.horizontal,
  //     child: Row(
  //       children: <Widget>[
  //         SizedBox(
  //           width: 30,
  //         ),
  //         CategoryCard(
  //           'Dental\nSurgeon',
  //           'assets/icons/doc/dental_surgeon.png',
  //           kBlueColor,
  //         ),
  //         SizedBox(
  //           width: 10,
  //         ),
  //         CategoryCard(
  //           'Heart\nSurgeon',
  //           'assets/icons/doc/heart_surgeon.png',
  //           kYellowColor,
  //         ),
  //         SizedBox(
  //           width: 10,
  //         ),
  //         CategoryCard(
  //           'Eye\nSpecialist',
  //           'assets/icons/doc/eye_specialist.png',
  //           kOrangeColor,
  //         ),
  //         SizedBox(
  //           width: 30,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  buildDoctorList() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Column(
        children: <Widget>[
          // DoctorCard(
          //   'Dr. Stella Kane',
          //   'Veterinary surgeons \n Flower Hospitals',
          //   'assets/images/doctor1.png',
          //   kBlueColor,
          // ),
          // SizedBox(
          //   height: 20,
          // ),
          
          Expanded(
            child: FutureBuilder<QuerySnapshot>(
            future:_fetch() as Future<QuerySnapshot>,
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                final List<QueryDocumentSnapshot> docs = snapshot.data!.docs.toList();
                return ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (BuildContext context, int index) {
            final QueryDocumentSnapshot doc = docs[index];
                final Map<String, dynamic>? data = doc.data() as Map<String, dynamic>;
            final String name = data?['name'] ?? 'Unknown';
            return DoctorCard(name
            , 'Veterinary specialists \n Flower Hospitals', 'assets/images/doctor2.png', kBlueColor);
                  },
                  
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
          )


            // 'Dr. Joseph Cart',
            // 'Veterinary specialists \n Flower Hospitals',
            // 'assets/images/doctor2.png',
            // kYellowColor,
        
          ,SizedBox(
            height: 20,
          ),
          // DoctorCard(
          //   'Dr. Stephanie',
          //   'Veterinary anesthesiologists \n Flower Hospitals',
          //   'assets/images/doctor3.png',
          //   kBlueColor,
          // ),
          // SizedBox(
          //   height: 20,
          // ),
          // DoctorCard(
          //   'Dr. Alex',
          //   'Veterinary dentists \n Flower Hospitals',
          //   'assets/images/doctor2.png',
          //   kOrangeColor,
          // ),
          // SizedBox(
          //   height: 20,
          // ),
          // DoctorCard(
          //   'Dr. John Cart',
          //   ' Veterinary dermatologists  \n Flower Hospitals',
          //   'assets/images/doctor2.png',
          //   kWhiteColor,
          // ),
          // SizedBox(
          //   height: 20,
          // ),
        ],
      ),
    );
  }
 Future<QuerySnapshot> _fetch() async {
  final QuerySnapshot snapshot = await FirebaseFirestore.instance
    .collection('users')
    .where('type', isEqualTo: 'Doctor')
    .get();
  return snapshot;
}

  // _fetch() async{
  //    final Firebasedoctor  = await FirebaseAuth.instance.loginUser();
  //    if(Firebasedoctor!=null)
  //    await FirebaseFirestore.instance
  //    .collection('users')
  //    .where('type',isEqualTo: 'Doctor')
  //    //.document(Firebasedoctor.uid)
  //    .get();
    //  .then((ds){
      
    //   var myname=ds.data['name';]
    //  });

  //}
}
//QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('users').where('type', isEqualTo: 'student').get();

