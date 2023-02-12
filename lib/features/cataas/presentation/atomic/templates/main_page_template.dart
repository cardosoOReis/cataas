import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import '../atoms/app_bar_icon.dart';
import '../atoms/get_random_cat_button_atom.dart';
import '../molecules/default_cat_app_bar_molecule.dart';
import '../organisms/cat_controls_organism.dart';
import '../organisms/result_display_organism.dart';

class MainPageTemplate extends StatelessWidget {
  final String title;
  final List<AppBarIcon> appBarIcons;
  final void Function() onGetRandomCatButtonTap;
  final void Function(String) onTextTextFieldValueChanged;
  final void Function(String url) onShareCatIconTap;
  final void Function(String url) onSaveCatIconTap;

  const MainPageTemplate({
    super.key,
    required this.appBarIcons,
    required this.title,
    required this.onGetRandomCatButtonTap,
    required this.onTextTextFieldValueChanged,
    required this.onShareCatIconTap,
    required this.onSaveCatIconTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultCatAppBarMolecule(
        title: title,
        icons: [
          ...appBarIcons,
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ResultDisplayOrganism(
                  onSaveCatIconTap: onSaveCatIconTap,
                  onShareCatIconTap: onShareCatIconTap,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: GetRandomCatButtonAtom(
                  onTap: onGetRandomCatButtonTap,
                  title: AppStrings.getRandomCat,
                  backgroundColor: AppColors.primary,
                ),
              ),
              CatControlsOrganism(
                onGetRandomCatButtonTap: onGetRandomCatButtonTap,
                onTextTextFieldChanged: onTextTextFieldValueChanged,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
