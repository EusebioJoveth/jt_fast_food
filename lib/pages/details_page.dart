import 'package:flutter/material.dart';
import 'package:jt_delivery/core/cor.dart';
import 'package:jt_delivery/core/data.dart';
import 'package:jt_delivery/widget/custom_app_bar.dart';
import 'dart:math' as math;

class DetailsPage extends StatefulWidget {
  final Food food;
  const DetailsPage({Key? key, required this.food}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: CustomAppBar(
              btnIcon1: 'arrow.png',
              btnIcon2: 'more.png',
              btnFunc1: () {
                Navigator.pop(context);
              },
              btnFunc2: () {},
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: widget.food.name,
                    style: TextStyle(
                      fontSize: 30.0,
                      color: brow,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: '\n${widget.food.name}',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: brow,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ]),
              )),
          SizedBox(
            height: 30.0,
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 30.0,
                    ),
                    height: 180.0,
                    decoration: BoxDecoration(
                      color: brow,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40.0),
                        bottomRight: Radius.circular(40.0),
                        topLeft: Radius.circular(40.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Caloria',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          widget.food.kal,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Peso:',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          widget.food.weight,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 10,
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(math.pi),
                    child: Image.asset(
                      widget.food.image,
                      height: 360.0,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Detalhe',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: black,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  widget.food.description,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: black,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Preço Total',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          widget.food.price,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: black,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 40.0,
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(
                          color: blue,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40.0),
                            bottomRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40.0),
                          )),
                      child: Center(
                        child: Text(
                          'Experimente o código promocional',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite,
                        color: brow,
                        size: 30.0,
                      ),
                    ),
                    Container(
                      height: 40.0,
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      decoration: BoxDecoration(
                        color: brow,
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Text(
                              'Adicionar ao Carrinho',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Icon(
                              Icons.add_shopping_cart_outlined,
                              color: white,
                              size: 20.0,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 30.0),
        ],
      ),
    ));
  }
}
