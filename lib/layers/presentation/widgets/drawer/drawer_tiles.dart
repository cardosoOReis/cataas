import 'package:flutter/material.dart';

import '../../auxiliar/color_palette.dart';

class DrawerTiles extends StatelessWidget {
  const DrawerTiles({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Material(
        color: Colors.white,
        elevation: 6.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: const EdgeInsets.only(left: 8),
                    child: Icon(
                      icon,
                      color: const Color.fromRGBO(255, 255, 255, 0),
                      size: 20,
                    )),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    letterSpacing: 0.2,
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: Icon(
                      icon,
                      color: ColorPalette.primaryColor,
                      size: 20,
                    )),
              ],
            ),
            Container(
              width: 150,
              height: 1,
              color: ColorPalette.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
