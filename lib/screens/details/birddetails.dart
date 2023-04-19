import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_mind/constants.dart';

import '../../models/birdproduct.dart';
import 'components/color_dot.dart';

class Birddetails extends StatelessWidget {
  const Birddetails({Key? key, required this.bird}) : super(key: key);

  final birdproduct bird;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bird.bgColor,
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              backgroundColor: Colors.white,
              child: SvgPicture.asset(
                "assets/icons/Heart.svg",
                height: 20,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Image.asset(
            bird.image,
            height: MediaQuery.of(context).size.height * 0.4,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: defaultPadding * 1.5),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(defaultPadding,
                  defaultPadding * 2, defaultPadding, defaultPadding),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(defaultBorderRadius * 3),
                  topRight: Radius.circular(defaultBorderRadius * 3),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          bird.title,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    //   const SizedBox(width: defaultPadding),
                    //   Text(
                    //     "\₹" + catproduct.price.toString(),
                    //     style: Theme.of(context).textTheme.headline6,
                    //   ),
                     ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: defaultPadding),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, ",
                    ),
                  ),
                    const SizedBox(width: defaultPadding),
                      Text(
                        "Price:  \₹" + bird.price.toString(),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: defaultPadding / 1),
                      const SizedBox(width: defaultPadding),
                      Text(
                        "Age: ${bird.age}Months",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: defaultPadding / 2),
                  // Text(
                  //   "Colors",
                  //   style: Theme.of(context).textTheme.titleSmall,
                  // ),
                  // const SizedBox(height: defaultPadding / 2),
                  // Row(
                  //   children: const [
                  //     ColorDot(
                  //       color: Color(0xFFBEE8EA),
                  //       isActive: false,
                  //     ),
                  //     ColorDot(
                  //       color: Color(0xFF141B4A),
                  //       isActive: true,
                  //     ),
                  //     ColorDot(
                  //       color: Color(0xFFF4E5C3),
                  //       isActive: false,
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(height: defaultPadding * 2),
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: const StadiumBorder()),
                        child: const Text("Add to Cart"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
