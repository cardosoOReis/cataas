import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../configs/app_colors.dart';
import '../../../configs/app_strings.dart';
import '../../cubits/cat_cubit.dart';
import '../atoms/cat_text_field/cat_message_text_field.dart';
import '../atoms/get_cat_button_atom/get_cat_button_atom.dart';

class GetRandomCatMolecule extends StatelessWidget {
  const GetRandomCatMolecule({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CatCubit>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: GetCatButtonAtom(
            title: AppStrings.getRandomCat,
            backgroundColor: AppColors.primary,
            onTap: cubit.onGetRandomCatButtonTap,
          ),
        ),
        CatMessageTextField(controller: cubit.textController),
      ],
    );
  }
}
