import 'package:flutter/material.dart';

class rabbitproduct {
  final String image, title;
  final int price,age;
  final Color bgColor;


  rabbitproduct({
    required this.image,
    required this.title,
    required this.price,
    required this.age,
    this.bgColor = const Color(0xFFEFEFF2),
  });
}

List<rabbitproduct> demo_rabbit = [
  rabbitproduct(
    image: "assets/rabbits/angora rabbit.jpg",
    title: "Angora rabbit",
    price: 449,
    age:2,
    bgColor: const Color(0xFFF8FEFB),
  ),
 
  rabbitproduct(
    image: "assets/rabbits/dwraf hotot.png",
    title: "Dwraf Hotot ",
    price: 500,
    age:3,
  ),
  
  rabbitproduct(
    image: "assets/rabbits/french lop.jpg",
    title: "French lop",
    price: 449,
    age:2,
    bgColor: const Color(0xFFF8FEFB),
  ),
   rabbitproduct(
    image: "assets/rabbits/rex rabbit.jpg",
    title: "Rex Rabbit ",
    price: 999,
    age:2,
    bgColor: const Color(0xFFFEFBF9),
  ),
  rabbitproduct(
    image: "assets/rabbits/rabbit1.png",
    title: "Bunny Rabbits",
    price: 149,
    age:2,
    bgColor: const Color(0xFFEEEEED),
  ),
];
