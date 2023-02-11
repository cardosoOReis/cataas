import 'package:cataas/features/cataas/presentation/atomic/atoms/app_bar_icon.dart';
import 'package:cataas/features/cataas/presentation/cubits/cat_cubit.dart';
import 'package:cataas/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../atomic/molecules/default_cat_app_bar_molecule.dart';

class CatPage extends StatelessWidget {
  const CatPage({super.key});

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
        ],
      ),
      body: BlocBuilder<CatCubit, CatState>(
        builder: (context, state) {
          return Placeholder();
        },
        bloc: sl<CatCubit>(),
        buildWhen: (previous, current) => previous.status != current.status,
      ),
    );
  }
}
