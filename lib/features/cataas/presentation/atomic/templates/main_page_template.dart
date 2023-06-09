import 'package:flutter/material.dart';

import '../atoms/app_bar_icon_atom/app_bar_icon_atom.dart';
import '../molecules/default_cat_app_bar_molecule.dart';
import '../organisms/cat_controls_organism.dart';
import '../organisms/result_display_organism.dart';

class MainPageTemplate extends StatelessWidget {
  final String title;
  final List<AppBarIconAtom> appBarIcons;
  const MainPageTemplate({
    super.key,
    required this.appBarIcons,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultCatAppBarMolecule(
        title: title,
        icons: appBarIcons,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ResultDisplayOrganism(),
          ),
          CatControlsOrganism(),
        ],
      ),
    );
  }
}
