import 'package:flutter/material.dart';

import '../atoms/app_bar_icon.dart';
import '../molecules/default_cat_app_bar_molecule.dart';
import '../organisms/cat_controls_organism.dart';
import '../organisms/result_display_organism.dart';

class MainPageTemplate extends StatelessWidget {
  final String title;
  final List<AppBarIcon> appBarIcons;
  final void Function() onGetRandomCatButtonTap;
  final void Function(String value) onGetCatByIdOrTagButtonTap;
  final void Function(String?) onTextTextFieldValueChanged;
  final void Function(String?) onFilterFieldValueChanged;
  final void Function(String url) onShareCatIconTap;
  final void Function(String url) onSaveCatIconTap;

  const MainPageTemplate({
    super.key,
    required this.appBarIcons,
    required this.title,
    required this.onGetRandomCatButtonTap,
    required this.onGetCatByIdOrTagButtonTap,
    required this.onTextTextFieldValueChanged,
    required this.onShareCatIconTap,
    required this.onSaveCatIconTap,
    required this.onFilterFieldValueChanged,
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
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ResultDisplayOrganism(
              onSaveCatIconTap: onSaveCatIconTap,
              onShareCatIconTap: onShareCatIconTap,
            ),
          ),
          CatControlsOrganism(
            onGetRandomCatButtonTap: onGetRandomCatButtonTap,
            onGetCatByIdOrTagButtonTap: onGetCatByIdOrTagButtonTap,
            onTextTextFieldChanged: onTextTextFieldValueChanged,
            onFilterFieldValueChanged: onFilterFieldValueChanged,
          ),
        ],
      ),
    );
  }
}
