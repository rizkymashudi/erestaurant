import 'package:erestaurant/common/style.dart';
import 'package:erestaurant/data/models/restaurant.dart';
import 'package:erestaurant/widgets/menu_widget.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/detail_page';
  final Restaurant restaurant;
  const DetailPage({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              restaurant.pictureId,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 328,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 40,
                                height: 6,
                                decoration: BoxDecoration(
                                    color: Colors.amber.shade900,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                              )
                            ],
                          ),
                          _header(),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            'Overview',
                            style: themeStyle.titleMedium,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            restaurant.description,
                            style: themeStyle.bodySmall,
                          ),
                          const SizedBox(height: 25),
                          Text(
                            'Foods menu',
                            style: themeStyle.titleMedium,
                          ),
                          const SizedBox(height: 25),
                          _menus(restaurant.menus.foods),
                          const SizedBox(height: 25),
                          Text(
                            'Drinks menu',
                            style: themeStyle.titleMedium,
                          ),
                          const SizedBox(height: 25),
                          _menus(restaurant.menus.drinks)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),

            // * Top bar button back
            _backButton(context),
          ],
        ),
      ),
    );
  }

  Padding _backButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              'assets/btn_back.png',
              width: 40,
            ),
          )
        ],
      ),
    );
  }

  SizedBox _menus(List<Drink> menus) {
    return SizedBox(
        height: 30,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: menus.length,
          itemBuilder: (context, index) {
            int i = 0;
            return Container(
              margin: EdgeInsets.only(right: i == 1 ? 0 : 5),
              child: MenuWidget(menu: menus[index]),
            );
          },
        ));
  }

  Container _header() {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Text(
              restaurant.name,
              style: themeStyle.titleLarge,
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Text('📍'),
                Text(
                  restaurant.city,
                  style: const TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ],
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                '⭐️',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                restaurant.rating.toString(),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
        )
      ]),
    );
  }
}
