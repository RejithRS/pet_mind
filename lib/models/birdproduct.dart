import 'package:flutter/material.dart';

class birdproduct {
  final String image, title;
  final int price,age;
  final Color bgColor;


  birdproduct({
    required this.image,
    required this.title,
    required this.price,
    required this.age,
    this.bgColor = const Color(0xFFEFEFF2),
  });
}

List<birdproduct> demo_bird = [
  birdproduct(
    image: "assets/Birds/pigeon.png",
    title: "Piegon ",
    price: 999,
    age:2,
    bgColor: const Color(0xFFFEFBF9),
  ),
  birdproduct(
    image: "assets/love.png",
    title: "LoveBirds ",
    price: 500,
    age:3,
  ),
  birdproduct(
    image: "assets/Birds/parrot1.png",
    title: "Parrot ",
    price: 449,
    age:2,
    bgColor: const Color(0xFFF8FEFB),
  ),
  birdproduct(
    image: "assets/rabbit1.png",
    title: "Bunny Rabbits",
    price: 149,
    age:2,
    bgColor: const Color(0xFFEEEEED),
  ),
];
