import 'package:flutter/material.dart';
import 'package:pet_mind/models/Product.dart';
import 'package:pet_mind/screens/details/details_screen.dart';

import '../../../constants.dart';
import '../../../models/rabbitproduct.dart';
import '../../details/rabbitdetails.dart';
import 'product_card.dart';
import 'section_title.dart';

class rabbits extends StatelessWidget {
  const rabbits({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: SectionTitle(
            title: "Rabbits",
            pressSeeAll: () {},
          ),
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              demo_rabbit.length,
            
              (index) => Padding(
                padding: const EdgeInsets.only(right: defaultPadding),
                child: ProductCard(
                  title: demo_rabbit[index].title,
                  image: demo_rabbit[index].image,
                  price: demo_rabbit[index].price,
                  age: demo_rabbit[index].age,
                  bgColor: demo_rabbit[index].bgColor,
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Rabbitdetails(rabbit: demo_rabbit[index]),
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
