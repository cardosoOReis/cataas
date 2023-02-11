import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../atomic/atoms/app_bar_icon.dart';
import '../atomic/atoms/get_random_cat_button_atom.dart';
import '../atomic/molecules/default_cat_app_bar_molecule.dart';
import '../atomic/organisms/cat_controls_organism.dart';
import '../atomic/organisms/result_display_organism.dart';
import '../cubits/cat_cubit.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';

class CatPage extends StatelessWidget {
  const CatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CatCubit>(context);
    final appBarIcons = <AppBarIcon>[
      AppBarIcon(
        onIconTap: cubit.onBeerIconTap,
        icon: const FaIcon(
          FontAwesomeIcons.beerMugEmpty,
          color: AppColors.white,
        ),
      ),
      AppBarIcon(
        onIconTap: cubit.onTwitterIconTap,
        icon: const FaIcon(
          FontAwesomeIcons.twitter,
          color: AppColors.white,
        ),
      ),
      AppBarIcon(
        onIconTap: () => null,
        icon: const FaIcon(
          FontAwesomeIcons.circleInfo,
          color: AppColors.white,
        ),
      ),
    ];

    return Scaffold(
      appBar: DefaultCatAppBarMolecule(
        title: AppStrings.title,
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
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: ResultDisplayOrganism(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: GetRandomCatButtonAtom(
                  onTap: cubit.onGetRandomCatButtonTap,
                  title: AppStrings.getRandomCat,
                  backgroundColor: AppColors.primary,
                ),
              ),
              CatControlsOrganism(
                onGetRandomCatButtonTap: cubit.onGetRandomCatButtonTap,
                onTextTextFieldChanged: cubit.onTextTextFieldValueChanged,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
