import 'package:cataas/features/cataas/presentation/atomic/atoms/app_bar_icon.dart';
import 'package:cataas/features/cataas/presentation/atomic/atoms/cat_display_atom.dart';
import 'package:cataas/features/cataas/presentation/atomic/atoms/get_random_cat_button_atom.dart';
import 'package:cataas/features/cataas/presentation/atomic/atoms/loading_widget_atom.dart';
import 'package:cataas/features/cataas/presentation/atomic/atoms/messaage_display_atom.dart';
import 'package:cataas/features/cataas/presentation/atomic/organisms/cat_controls_organism.dart';
import 'package:cataas/features/cataas/presentation/cubits/cat_cubit.dart';
import 'package:cataas/features/cataas/presentation/utils/app_colors.dart';
import 'package:cataas/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../atomic/molecules/default_cat_app_bar_molecule.dart';

class CatPage extends StatelessWidget {
  const CatPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final dimens = MediaQuery.of(context).size;

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
                padding: const EdgeInsets.all(8.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        spreadRadius: 3,
                      ),
                    ],
                    border: const Border.fromBorderSide(
                      BorderSide(
                        color: AppColors.white,
                        width: 2,
                      ),
                    ),
                  ),
                  child: SizedBox(
                    height: 400,
                    width: double.maxFinite,
                    child: BlocBuilder<CatCubit, CatState>(
                      builder: (context, state) {
                        if (state.status.isInitial) {
                          return MessaageDisplayAtom(message: 'Get a Cat 😺');
                        }
                        if (state.status.isLoading) {
                          return LoadingWidgetAtom();
                        }
                        if (state.status.isSuccess) {
                          return CatDisplayAtom(
                            catEntity: state.catEntity!,
                          );
                        }
                        if (state.status.isFailure) {
                          return MessaageDisplayAtom(
                            message: state.failure!.message,
                          );
                        }

                        return Placeholder();
                      },
                    ),
                  ),
                ),
              ),
              CatControlsOrganism(
                onGetRandomCatButtonTap:
                    BlocProvider.of<CatCubit>(context).onGetRandomCatButtonTap,
                onTextTextFieldChanged: (text) => null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
