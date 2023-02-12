import 'package:cataas/core/error/failures.dart';
import 'package:cataas/features/cataas/presentation/atomic/atoms/saved_cat_toast.dart';
import 'package:cataas/features/cataas/presentation/atomic/molecules/cat_info_molecule.dart';
import 'package:cataas/features/cataas/presentation/utils/app_colors.dart';
import 'package:cataas/features/cataas/presentation/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../cubits/cat_cubit.dart';
import '../atoms/cat_display_atom.dart';
import '../atoms/loading_widget_atom.dart';
import '../atoms/main_cat_frame_atom.dart';
import '../atoms/message_display_atom.dart';

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
    return MainCatFrameAtom(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 150,
          minWidth: double.maxFinite,
        ),
        child: BlocConsumer<CatCubit, CatState>(
          listener: (context, state) {
            if (state.savingCatStatus.isSuccess) {
              FToast().init(context).showToast(
                    child: SavedCatToast(
                      text: AppStrings.saveCatLocallySuccess,
                      icon: const Icon(Icons.check),
                      color: Colors.greenAccent,
                    ),
                  );
            }
            if (state.savingCatStatus.isFailure) {
              FToast().init(context).showToast(
                    toastDuration: const Duration(seconds: 4),
                    child: SavedCatToast(
                      text: AppStrings.saveCatLocallyFailure,
                      icon: const Icon(Icons.error),
                      color: Colors.redAccent,
                    ),
                  );
            }
          },
          listenWhen: (previous, current) =>
              previous.savingCatStatus != current.savingCatStatus,
          builder: (context, state) {
            if (state.status.isInitial) {
              return const Center(
                child: MessageDisplayAtom(message: 'Get a Cat 😺'),
              );
            }
            if (state.status.isLoading) {
              return const LoadingWidgetAtom();
            }
            if (state.status.isSuccess) {
              return Center(
                child: Column(
                  children: [
                    CatDisplayAtom(
                      catEntity: state.catEntity!,
                    ),
                    CatInfoMolecule(
                      catId: state.catEntity!.id,
                      onShareCatIconTap: onShareCatIconTap,
                      onSaveCatIconTap: onSaveCatIconTap,
                      url: state.catEntity!.url,
                    ),
                  ],
                ),
              );
            }
            if (state.status.isFailure) {
              return MessageDisplayAtom(
                message: state.failure!.message,
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
