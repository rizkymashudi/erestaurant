import 'package:erestaurant/common/style.dart';
import 'package:flutter/material.dart';

class ImageThumbnail extends StatelessWidget {
  const ImageThumbnail({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: SizedBox(
        width: 130,
        height: 110,
        child: Stack(
          children: [
            Image.asset(
              'assets/burger.jpg',
              width: 130,
              height: 110,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 70,
                height: 30,
                decoration: const BoxDecoration(
                  color: secondaryColor,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(30)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/ic-star.png',
                      width: 22,
                      height: 22,
                      color: Colors.yellow,
                    ),
                    Text('4.6', style: themeStyle.titleSmall)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
