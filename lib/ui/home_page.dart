import 'package:erestaurant/data/models/restaurant.dart';
import 'package:erestaurant/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home_page';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Restaurant'),
        ),
        body: SafeArea(
            bottom: false,
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: _buildListRestaurant(context),
              ),
            )));
  }

  FutureBuilder<String> _buildListRestaurant(BuildContext context) {
    return FutureBuilder<String>(
      future:
          DefaultAssetBundle.of(context).loadString('assets/local_data.json'),
      builder: (context, snapshot) {
        final List restaurants = parseArticles(snapshot.data);
        int index = 0;
        return ListView(
          children: restaurants.map((data) {
            return Container(
                margin: EdgeInsets.only(top: index == 1 ? 0 : 20),
                child: CardWidget(restaurant: data));
          }).toList(),
        );
      },
    );
  }
}
