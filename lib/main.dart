import 'package:erestaurant/common/style.dart';
import 'package:erestaurant/data/models/restaurant.dart';
import 'package:erestaurant/ui/detail_page.dart';
import 'package:erestaurant/ui/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(elevation: 0),
          colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: primaryColor,
              secondary: secondaryColor,
              onPrimary: Colors.black),
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: themeStyle,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: secondaryColor,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18)))))),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        DetailPage.routeName: (context) => DetailPage(
            restaurant:
                ModalRoute.of(context)?.settings.arguments as Restaurant),
      },
    );
  }
}
