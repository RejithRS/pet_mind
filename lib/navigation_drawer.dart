import 'package:flutter/material.dart';
import 'package:pet_mind/contactus.dart';
import 'package:pet_mind/drawer_item.dart';
import 'package:pet_mind/login.dart';
import 'package:pet_mind/pages/peoples.dart';
import 'package:pet_mind/screens/home/home_screen.dart';
import 'package:pet_mind/settings.dart';

import 'auth.dart';
import 'mypets.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);
 void signOutUser() async {
    await AuthMethods().signOut();
    
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 80, 24, 0),
          child: Column(
            children: [
              headerWidget(),
              const SizedBox(height: 30,),
              const Divider(thickness: 1, height: 10, color: Colors.grey,),
              const SizedBox(height: 30,),
 
              DrawerItem(
                  name: 'My Account',
                  icon: Icons.account_box_rounded,
                  onPressed: (){}//=> onItemPressed(context, index: 1)
              ),
              const SizedBox(height: 30,),
              DrawerItem(
                  name: 'Chats',
                  icon: Icons.message_outlined,
                  onPressed: (){}//=> onItemPressed(context, index: 2)
              ),
              const SizedBox(height: 30,),
              DrawerItem(
                  name: 'My Pets',
                  icon: Icons.pets_outlined,
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>PetScreen()));
                    
                  }//=> onItemPressed(context, index: 2)
              ),
              const SizedBox(height: 30,),
              DrawerItem(
                  name: 'Favourites',
                  icon: Icons.favorite_outline,
                  onPressed: (){}//=> onItemPressed(context, index: 3)
              ),
              const SizedBox(height: 30,),
              //const Divider(thickness: 1, height: 10, color: Colors.grey,),
              //const SizedBox(height: 30,),
              DrawerItem(
                  name: 'Settings',
                  icon: Icons.settings,
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const SettingsPage()));
                    
                  }//=> onItemPressed(context, index: 4)
              ),
              const SizedBox(height: 30,),
              DrawerItem(
                  name: 'Contact Us',
                  icon: Icons.contact_mail_outlined,
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ContactUsScreen()));
                  }//=> onItemPressed(context, index: 5)
              ),
              const SizedBox(height: 30,),
              DrawerItem(
                  name: 'Logout',
                  icon: Icons.logout,
                  onPressed: (){
                    Navigator.of(context).pop();
  Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => MyLogin()));
                    signOutUser();
                  }//=> onItemPressed(context, index: 6)
              ),

            ],
          ),
        ),
      ),
    );
  }

  // void onItemPressed(BuildContext context, {required int index}){
  //   Navigator.pop(context);

  //   switch(index){
  //     case 0:
  //       Navigator.push(context, MaterialPageRoute(builder: (context) => const People()));
  //       break;
  //   }
  // }

  Widget headerWidget() {
    const url = 'https://static.vecteezy.com/system/resources/previews/002/275/847/original/male-avatar-profile-icon-of-smiling-caucasian-man-vector.jpg';
    return Row(
      children: [
        const CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(url),
        ),
        const SizedBox(width: 20,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('User', style: TextStyle(fontSize: 14, color: Colors.white)),
            SizedBox(height: 10,),
            Text('user@email.com', style: TextStyle(fontSize: 14, color: Colors.white))
          ],
        )
      ],
    );

  }
}





//import 'package:flutter/material.dart';
//import 'package:petshoppe/navigation_drawer.dart';

// void main() {
//   runApp(const MaterialApp(
//     home: Home(),
//   ));
// }

// class Home extends StatelessWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: const NavDrawer(),
//       appBar: AppBar(
//         title: const Text('Navigation Drawer'),
//         centerTitle: true,
//         backgroundColor: Colors.black,
//       ),
//       body: Builder(
//         builder: (context) {
//           return Center(
//             child: SizedBox(
//               height: 50,
//               width: MediaQuery.of(context).size.width - 100,
//               child: ElevatedButton.icon(
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.black,
//                 ),
//                 onPressed: () {
//                   Scaffold.of(context).openDrawer();
//                 },
//                 icon: const Icon(Icons.open_in_new, color: Colors.white),
//                 label: const Text(
//                   'Open Navigation Drawer',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),
//           );
//         }
//       )
//     );
//   }
// }