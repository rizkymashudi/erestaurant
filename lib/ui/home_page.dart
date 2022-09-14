import 'package:erestaurant/common/style.dart';
import 'package:erestaurant/data/models/restaurant.dart';
import 'package:erestaurant/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home_page';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView(physics: const NeverScrollableScrollPhysics(), children: [
        _headTitle(),
        SizedBox(
          height: MediaQuery.of(context).size.height - 210,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: _buildListRestaurant(context),
          ),
        ),
      ]),
    )));
  }

  Column _headTitle() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Text(
            "eRestaurant",
            style: themeStyle.headlineMedium,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Text(
            "Recommendation restaurant for you!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }

  FutureBuilder<String> _buildListRestaurant(BuildContext context) {
    return FutureBuilder<String>(
      future:
          DefaultAssetBundle.of(context).loadString('assets/local_data.json'),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }
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
