import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String btnIcon1;
  final String btnIcon2;
  final Function() btnFunc1;
  final Function() btnFunc2;
  const CustomAppBar(
      {Key? key,
      required this.btnIcon1,
      required this.btnIcon2,
      required this.btnFunc1,
      required this.btnFunc2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            btnFunc1();
          },
          child: Container(
            height: 50.0,
            width: 50.0,
            child: Image.asset('assets/image/$btnIcon1'),
          ),
        ),
        GestureDetector(
          onTap: () => btnFunc2,
          child: Container(
            height: 40.0,
            width: 45.0,
            padding: const EdgeInsets.only(left: 5.0),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 169, 137),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
                topLeft: Radius.circular(30.0),
              ),
            ),
            child: Image.asset(
              'assets/image/$btnIcon2',
              height: 45.0,
            ),
          ),
        ),
      ],
    );
  }
}
