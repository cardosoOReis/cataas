import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../core/error/failures.dart';
import '../../cubits/cat_cubit.dart';
import '../../utils/app_strings.dart';
import '../atoms/cat_display_atom.dart';
import '../atoms/loading_widget_atom.dart';
import '../atoms/main_cat_frame_atom.dart';
import '../atoms/message_display_atom.dart';
import '../atoms/cat_toast.dart';
import '../molecules/cat_info_molecule.dart';

class ResultDisplayOrganism extends StatelessWidget {
  final void Function(String url) onShareCatIconTap;
  final void Function(String url) onSaveCatIconTap;

  const ResultDisplayOrganism({
    Key? key,
    required this.onShareCatIconTap,
    required this.onSaveCatIconTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 150,
        minWidth: double.maxFinite,
      ),
      child: MainCatFrameAtom(
        child: BlocConsumer<CatCubit, CatState>(
          listener: (context, state) {
            if (state.savingCatStatus.isSuccess) {
              FToast()
                ..init(context)
                ..showToast(
                  child: CatToast(
                    text: AppStrings.saveCatLocallySuccess,
                    icon: const Icon(Icons.check),
                    color: Colors.greenAccent,
                  ),
                );
            }
            if (state.savingCatStatus.isFailure) {
              FToast()
                ..init(context)
                ..showToast(
                  toastDuration: const Duration(seconds: 4),
                  child: CatToast(
                    text: AppStrings.saveCatLocallyFailure,
                    icon: const Icon(Icons.error),
                    color: Colors.redAccent,
                  ),
                );
            }
            if (state.shareCatStatus.isFailure) {
              FToast()
                ..init(context)
                ..showToast(
                  child: CatToast(
                    text: AppStrings.shareCatFailure,
                    icon: const Icon(Icons.error),
                    color: Colors.redAccent,
                  ),
                );
            }
          },
          listenWhen: (previous, current) =>
              previous.savingCatStatus != current.savingCatStatus ||
              previous.shareCatStatus != current.shareCatStatus,
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
                    onShareCatIconTap: onShareCatIconTap,
                    onSaveCatIconTap: onSaveCatIconTap,
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
