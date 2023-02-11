import 'package:cataas/features/cataas/presentation/atomic/atoms/app_bar_icon.dart';
import 'package:cataas/features/cataas/presentation/atomic/atoms/cat_display_atom.dart';
import 'package:cataas/features/cataas/presentation/atomic/atoms/loading_widget_atom.dart';
import 'package:cataas/features/cataas/presentation/atomic/atoms/messaage_display_atom.dart';
import 'package:cataas/features/cataas/presentation/atomic/organisms/cat_controls_organism.dart';
import 'package:cataas/features/cataas/presentation/cubits/cat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../atomic/molecules/default_cat_app_bar_molecule.dart';

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
                padding: const EdgeInsets.all(8.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        spreadRadius: 5,
                      ),
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: 2.5,
                      ),
                      BoxShadow(
                        color: Colors.black,
                      ),
                    ],
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
                          print(state.catEntity?.text);

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
