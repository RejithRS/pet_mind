import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/birdproduct.dart';
import '../../details/birddetails.dart';
import 'product_card.dart';
import 'section_title.dart';

class Birds extends StatelessWidget {
  const Birds({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: SectionTitle(
            title: "Birds",
            pressSeeAll: () {},
          ),
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              demo_bird.length,
            
              (index) => Padding(
                padding: const EdgeInsets.only(right: defaultPadding),
                child: ProductCard(
                  title: demo_bird[index].title,
                  image: demo_bird[index].image,
                  price: demo_bird[index].price,
                  age: demo_bird[index].age,
                  bgColor: demo_bird[index].bgColor,
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Birddetails(bird: demo_bird[index]),
                        ));
                  },
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
