import 'package:flutter/material.dart';

class Product {
  final String image, title;
  final int price,age;
  final Color bgColor;


  Product({
    required this.image,
    required this.title,
    required this.price,
    required this.age,
    this.bgColor = const Color(0xFFEFEFF2),
  });
}

List<Product> demo_product = [
  Product(
    image: "assets/Dogs/dog1.png",
    title: "Beagle ",
    price: 999,
    age:2,
    bgColor: const Color(0xFFFEFBF9),
  ),
  Product(
    image: "assets/Dogs/pomerian.jpg",
    title: "Pomerian ",
    price: 500,
    age:3,
  ),
  Product(
    image: "assets/Dogs/pub.png",
    title: "Pug ",
    price: 449,
    age:2,
    bgColor: const Color(0xFFF8FEFB),
  ),
  Product(
    image: "assets/Dogs/husky.png",
    title: "Husky ",
    price: 149,
    age:2,
    bgColor: const Color(0xFFEEEEED),
  ),
];
