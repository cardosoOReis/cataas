import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../cubits/cat_cubit.dart';
import '../../utils/app_strings.dart';
import '../atoms/cat_display_atom.dart';
import '../atoms/loading_widget_atom.dart';
import '../atoms/main_cat_frame_atom.dart';
import '../atoms/message_display_atom.dart';
import '../molecules/cat_info_molecule.dart';

class ResultDisplayOrganism extends StatelessWidget {
  const ResultDisplayOrganism({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 150,
        minWidth: double.maxFinite,
      ),
      child: MainCatFrameAtom(
        child: BlocBuilder<CatCubit, CatState>(
          builder: (context, state) {
            if (state.status.isInitial) {
              return Center(
                child: MessageDisplayAtom(
                  message: AppStrings.initialStateText,
                ),
              );
            }
            if (state.status.isLoading) {
              return const LoadingWidgetAtom();
            }
            if (state.status.isFailure) {
              final failure = state.failure!;
              if (failure is ApiFailure) {
                return MessageDisplayAtom(
                  message: failure.exception.message,
                );
              }

              return MessageDisplayAtom(
                message: state.failure!.message,
              );
            }
            if (state.status.isSuccess) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: CatDisplayAtom(
                      catEntity: state.catEntity!,
                    ),
                  ),
                  CatInfoMolecule(
                    catId: state.catEntity!.id,
                    url: state.catEntity!.url,
                  ),
                ],
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
