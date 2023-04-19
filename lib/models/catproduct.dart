import 'package:flutter/material.dart';

class catproduct {
  final String image, title;
  final int price,age;
  final Color bgColor;


  catproduct({
    required this.image,
    required this.title,
    required this.price,
    required this.age,
    this.bgColor = const Color(0xFFEFEFF2),
  });
}

List<catproduct> demo_cat = [
  catproduct(
    image: "assets/Cats/Snowshoe.png",
    title: "Snowshoe",
    price: 999,
    age:2,
    bgColor: const Color(0xFFFEFBF9),
  ),
  catproduct(
    image: "assets/Cats/cat1.jpg",
    title: "Persian ",
    price: 500,
    age:3,
  ),
  catproduct(
    image: "assets/Cats/abyssinian.jpg",
    title: "Abyssinian ",
    price: 449,
    age:2,
    bgColor: const Color(0xFFF8FEFB),
  ),
  catproduct(
    image: "assets/Cats/laperm.jpg",
    title: "Laperm ",
    price: 149,
    age:2,
    bgColor: const Color(0xFFEEEEED),
  ),
];
