import 'package:flutter/material.dart';

import '../../../../configs/app_colors.dart';
import '../../../../configs/app_strings.dart';
import 'get_cat_button_atom.dart';

class GetRandomCatButtonAtom extends StatelessWidget {
  final VoidCallback onTap;

  const GetRandomCatButtonAtom({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) => GetCatButtonAtom(
        onTap: onTap,
        title: AppStrings.getRandomCat,
        backgroundColor: AppColors.primary,
      );
}
