import 'package:erestaurant/common/style.dart';
import 'package:erestaurant/data/models/restaurant.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  final Drink menu;
  const MenuWidget({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            menu.name,
            style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
