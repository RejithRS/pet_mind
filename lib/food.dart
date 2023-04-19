import 'package:flutter/material.dart';

class Pet {
  final String name;
  final String breed;
  final int age;
  final String imageUrl;

  Pet({
    required this.name,
    required this.breed,
    required this.age,
    required this.imageUrl,
  });
}

class MyPetsPage extends StatelessWidget {
  final List<Pet> pets = [
    Pet(
      name: 'Fluffy',
      breed: 'Persian',
      age: 3,
      imageUrl:
          'https://images.pexels.com/photos/45201/kitty-cat-kitten-pet-45201.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    ),
    Pet(
      name: 'Buddy',
      breed: 'Labrador Retriever',
      age: 5,
      imageUrl:
          'https://images.pexels.com/photos/356378/pexels-photo-356378.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    ),
    Pet(
      name: 'Socks',
      breed: 'Siamese',
      age: 2,
      imageUrl:
          'https://images.pexels.com/photos/1091711/pexels-photo-1091711.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Pets'),
      ),
      body: ListView.builder(
        itemCount: pets.length,
        itemBuilder: (BuildContext context, int index) {
          final pet = pets[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(pet.imageUrl),
            ),
            title: Text(pet.name),
            subtitle: Text('${pet.breed}, ${pet.age} years old'),
            onTap: () {
              // Navigate to pet details page
            },
          );
        },
      ),
    );
  }
}