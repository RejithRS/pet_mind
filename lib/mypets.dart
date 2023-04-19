// import 'package:flutter/material.dart';

// class Pet {
//   final String name;
//   final String breed;
//   final int age;
//   final String imageUrl;

//   Pet({
//     required this.name,
//     required this.breed,
//     required this.age,
//     required this.imageUrl,
//   });
// }

// class MyPetsPage extends StatelessWidget {
//   final List<Pet> pets = [
//     Pet(
//       name: 'Fluffy',
//       breed: 'Persian',
//       age: 3,
//       imageUrl:
//           'https://images.pexels.com/photos/45201/kitty-cat-kitten-pet-45201.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
//     ),
//     Pet(
//       name: 'Buddy',
//       breed: 'Labrador Retriever',
//       age: 5,
//       imageUrl:
//           'https://images.pexels.com/photos/356378/pexels-photo-356378.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
//     ),
//     Pet(
//       name: 'Socks',
//       breed: 'Siamese',
//       age: 2,
//       imageUrl:
//           'https://images.pexels.com/photos/1091711/pexels-photo-1091711.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Pets'),
//       ),
//       body: ListView.builder(
//         itemCount: pets.length,
//         itemBuilder: (BuildContext context, int index) {
//           final pet = pets[index];
//           return ListTile(
//             leading: CircleAvatar(
//               backgroundImage: NetworkImage(pet.imageUrl),
//             ),
//             title: Text(pet.name),
//             subtitle: Text('${pet.breed}, ${pet.age} years old'),
//             onTap: () {
//               // Navigate to pet details page
//             },
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class Pet {
  final String name;
  final int age;
  final String breed;

  Pet({required this.name, required this.age, required this.breed});
}

class PetForm extends StatefulWidget {
  final Function onSubmit;

  PetForm({required this.onSubmit});

  @override
  _PetFormState createState() => _PetFormState();
}

class _PetFormState extends State<PetForm> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late int _age;
  late String _breed;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Name',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a name';
              }
              return null;
            },
            onSaved: (value) {
              _name = value!;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Age',
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an age';
              }
              try {
                int.parse(value);
              } catch (_) {
                return 'Please enter a valid age';
              }
              return null;
            },
            onSaved: (value) {
              _age = int.parse(value!);
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Breed',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a breed';
              }
              return null;
            },
            onSaved: (value) {
              _breed = value!;
            },
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                widget.onSubmit(Pet(name: _name, age: _age, breed: _breed));
                Navigator.pop(context);
              }
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
}

class PetScreen extends StatefulWidget {
  @override
  _PetScreenState createState() => _PetScreenState();
}

class _PetScreenState extends State<PetScreen> {
  List<Pet> _pets = [];

  void _addPet(Pet pet) {
    setState(() {
      _pets.add(pet);
    });
  }

  void _showAddPetDialog() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Pet'),
          content: PetForm(onSubmit: _addPet),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pets'),
      ),
      body: ListView.builder(
        itemCount: _pets.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_pets[index].name),
            subtitle: Text('Age: ${_pets[index].age}, Breed: ${_pets[index].breed}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddPetDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}
