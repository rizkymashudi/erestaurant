import 'package:erestaurant/common/style.dart';
import 'package:erestaurant/data/models/restaurant.dart';
import 'package:erestaurant/ui/detail_page.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final Restaurant restaurant;
  const CardWidget({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DetailPage.routeName,
            arguments: restaurant);
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: SizedBox(
              width: 130,
              height: 90,
              child: Stack(
                children: [
                  Image.network(
                    restaurant.pictureId,
                    width: 200,
                    height: 130,
                    fit: BoxFit.cover,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                restaurant.name,
                style: themeStyle.titleMedium,
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                children: [
                  const Text('📍'),
                  Text(
                    restaurant.city,
                    style: const TextStyle(
                        fontWeight: FontWeight.w200, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                children: [
                  const Text('⭐️'),
                  Text(
                    restaurant.rating.toString(),
                    style: themeStyle.titleSmall,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
