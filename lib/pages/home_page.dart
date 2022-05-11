import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jt_delivery/core/data.dart';
import 'package:jt_delivery/core/cor.dart';
import 'package:jt_delivery/pages/details_page.dart';
import '../widget/custom_app_bar.dart';

class HomePge extends StatefulWidget {
  const HomePge({Key? key}) : super(key: key);

  @override
  State<HomePge> createState() => _HomePgeState();
}

class _HomePgeState extends State<HomePge> {
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(
                    btnIcon1: 'menu.png',
                    btnFunc1: () {},
                    btnIcon2: 'search.png',
                    btnFunc2: () {},
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'Olá JT',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  const Text(
                    'Quer pedir comida deliciosa?',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        'Categorias',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Ver Todos',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  // ignore: sized_box_for_whitespace
                  Container(
                    height: 250.0,
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: categories.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2,
                        childAspectRatio: 1.5,
                      ),
                      itemBuilder: (itemBuilder, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() => selectIndex = index);
                          },
                          child: Container(
                            height: 50.0,
                            margin: const EdgeInsets.only(
                                bottom: 10.0, right: 10.0),
                            decoration: BoxDecoration(
                              color: selectIndex == index ? blue : gray,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  categories[index].image,
                                  height: 30.0,
                                  width: 30.0,
                                  color: selectIndex == index ? white : black,
                                ),
                                const SizedBox(height: 10.0),
                                Text(
                                  categories[index].name,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: selectIndex == index ? white : black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 7.0),
                  const Text(
                    'Comida Requintada',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  )
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 25.0, left: 20.0),
              scrollDirection: Axis.horizontal,
              itemCount: foods.length,
              itemBuilder: (itemBuilder, index) {
                final food = foods[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => DetailsPage(food: food)));
                  },
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 130.0,
                          width: 190.0,
                          margin: const EdgeInsets.only(right: 10.0),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 30.0,
                          ),
                          decoration: BoxDecoration(
                            color: index % 2 == 0 ? brow : gray,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                food.title,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: index % 2 == 0 ? white : black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              Text(
                                food.price,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: index % 2 == 0 ? white : black,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Image.asset(
                        food.image,
                        height: 150.0,
                      )
                    ],
                  ),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
