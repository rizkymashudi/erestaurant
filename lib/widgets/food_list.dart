import 'package:erestaurant/common/style.dart';
import 'package:erestaurant/data/models/restaurant.dart';
import 'package:erestaurant/widgets/image_thumbnail.dart';
import 'package:flutter/material.dart';

class FoodList extends StatelessWidget {
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future:
          DefaultAssetBundle.of(context).loadString('assets/local_data.json'),
      builder: (context, snapshot) {
        return Text('data');
      },
    );
  }

  InkWell _inkWell(BuildContext context, Restaurant restaurant) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          const ImageThumbnail(),
          const SizedBox(
            width: 20,
          ),
          _descriptionColumn()
        ],
      ),
    );
  }

  Column _descriptionColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Food title", style: themeStyle.titleLarge),
        const SizedBox(height: 20),
        const Text("City")
      ],
    );
  }
}
