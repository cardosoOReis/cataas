import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';

import '../../../data/datasources/remote/default_get_cat_amount_datasource_imp.dart';
import '../../../data/datasources/remote/default_get_cat_by_id_datasource_imp.dart';
import '../../../data/datasources/remote/default_get_random_cat_datasource_imp.dart';
import '../../../data/datasources/remote/default_get_random_cat_with_params_datasource_imp.dart';
import '../../../data/repositories/get_cat_amount_repository_imp.dart';
import '../../../data/repositories/get_cat_by_id_repository_imp.dart';
import '../../../data/repositories/get_random_cat_repository_imp.dart';
import '../../../data/repositories/get_random_cat_with_params_repository_imp.dart';
import '../../../domain/usecases/get_cat_amount/get_cat_amount_usecase_imp.dart';
import '../../../domain/usecases/get_cat_by_id/get_cat_by_id_usecase_imp.dart';
import '../../../domain/usecases/get_random_cat/get_random_cat_usecase_imp.dart';
import '../../../domain/usecases/get_random_cat_with_params/get_random_cat_with_params_usecase_imp.dart';
import '../../auxiliar/color_palette.dart';
import '../../controller/cat_controller.dart';
import '../../functions/open_browser.dart';
import 'drawer_tiles.dart';

// ignore: must_be_immutable
class DefaultDrawer extends StatelessWidget {
  DefaultDrawer({Key? key}) : super(key: key);
  CatController controller = CatController(
    GetRandomCatUsecaseImp(
      GetRandomCatRepositoryImp(
        DefaultGetRandomCatDatasourceImp(),
      ),
    ),
    GetCatByIdUsecaseImp(
      GetCatByIdRepositoryImp(
        DefaultGetCatByIdDatasourceImp(),
      ),
    ),
    GetRandomCatWithParamsUsecaseImp(
      GetRandomCatWithParamsRepositoryImp(
          DefaultGetRandomCatWithParamsDatasourceImp()),
    ),
    GetCatAmountUsecaseImp(
      GetCatAmountRepositoryImp(
        DefaultGetCatAmountDatasourceImp(),
      ),
    ),
  );

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
                      Text options;
                      if (snapshot.hasData) {
                        options = Text(
                          'Have ${snapshot.data} cats for now',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 15),
                        );
                      } else {
                        options = const Text(
                          'Have 0 cats for now',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        );
                      }
                      return options;
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
