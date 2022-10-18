import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get_it/get_it.dart';

import '../../auxiliar/color_palette.dart';
import '../../controller/cat_controller.dart';
import '../../utils/open_browser.dart';
import 'drawer_tiles.dart';

// ignore: must_be_immutable
class DefaultDrawer extends StatelessWidget {
  DefaultDrawer({Key? key}) : super(key: key);
  CatController controller = GetIt.instance<CatController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              margin: EdgeInsets.zero,
              decoration: const BoxDecoration(
                color: ColorPalette.primaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'CATAAS',
                    style: TextStyle(
                        color: Colors.white, fontSize: 25, letterSpacing: 1.5),
                  ),
                  const Text(
                    'Cat as a service',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const Text(
                    'A REST API to spread peace and love (or not) thanks to cats.',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  FutureBuilder(
                    future: controller.getCatAmount(),
                    builder: (context, snapshot) {
                      int options;
                      if (snapshot.hasData) {
                        options = snapshot.data!;
                      } else {
                        options = 0;
                      }
                      return Text(
                        'Have $options cats for now',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15),
                      );
                    },
                  )
                ],
              )),
          GestureDetector(
              onTap: () {
                OpenBrowser.execute(Uri.parse("https://cataas.com/#/upload"));
              },
              child: const DrawerTiles(
                title: "Post a Cat",
                icon: FontAwesome.paw,
              )),
          GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/about");
              },
              child: const DrawerTiles(
                title: "About",
                icon: FontAwesome.info,
              )),
          GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/about");
              },
              child: const DrawerTiles(
                title: "Authors",
                icon: Icons.person,
              )),
          GestureDetector(
              onTap: () {
                OpenBrowser.execute(Uri.parse(
                    'https://firewall.oauthorize.tk/privacy-policy?client_id=cataas'));
              },
              child: const DrawerTiles(
                title: "Privacy Policy",
                icon: Icons.privacy_tip,
              )),
        ],
      ),
    );
  }
}
