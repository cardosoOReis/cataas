import 'package:flutter/material.dart';

import '../atoms/app_bar_icon.dart';
import '../molecules/default_cat_app_bar_molecule.dart';

class MainPageTemplate extends StatelessWidget {
  final List<AppBarIcon>? appBarIcons;
  const MainPageTemplate({super.key, required this.appBarIcons});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultCatAppBarMolecule(
        title: 'Cat as a Service',
        icons: [
          AppBarIcon(
            onIconTap: () => print("Funcionando"),
            icon: Icon(Icons.flutter_dash),
          ),
          AppBarIcon(
            onIconTap: () => print("Funcionando"),
            icon: Icon(Icons.install_mobile_rounded),
          ),
        ],
      ),
    );
  }
}
