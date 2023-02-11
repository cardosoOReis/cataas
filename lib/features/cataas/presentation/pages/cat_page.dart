import 'package:cataas/features/cataas/presentation/atomic/atoms/app_bar_icon.dart';
import 'package:cataas/features/cataas/presentation/atomic/atoms/get_random_cat_button_atom.dart';
import 'package:cataas/features/cataas/presentation/atomic/organisms/cat_controls_organism.dart';
import 'package:cataas/features/cataas/presentation/cubits/cat_cubit.dart';
import 'package:cataas/features/cataas/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../atomic/molecules/default_cat_app_bar_molecule.dart';
import '../atomic/organisms/result_display_organism.dart';

class CatPage extends StatelessWidget {
  const CatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CatCubit>(context);

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: GetRandomCatButtonAtom(
                  onTap: cubit.onGetRandomCatButtonTap,
                  title: 'Get a random Cat',
                  backgroundColor: AppColors.primary,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ResultDisplayOrganism(),
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
