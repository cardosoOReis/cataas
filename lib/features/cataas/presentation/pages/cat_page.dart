import 'package:cataas/features/cataas/presentation/atomic/templates/main_page_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../atomic/atoms/app_bar_icon.dart';
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
    ];

    return MainPageTemplate(
      title: AppStrings.title,
      appBarIcons: appBarIcons,
      onGetRandomCatButtonTap: cubit.onGetRandomCatButtonTap,
      onTextTextFieldValueChanged: cubit.onTextTextFieldValueChanged,
      onSaveCatIconTap: cubit.onSaveCatIconTap,
      onShareCatIconTap: cubit.onShareCatIconTap,
    );
  }
}
