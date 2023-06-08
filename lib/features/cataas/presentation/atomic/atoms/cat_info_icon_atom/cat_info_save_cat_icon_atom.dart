import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../usecases/i_save_cat_locally_usecase.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_strings.dart';
import '../cat_toast_atom/cat_toast_failure_atom.dart';
import '../cat_toast_atom/cat_toast_sucess_atom.dart';
import '../show_toast_atom/i_show_toast_atom.dart';
import 'cat_info_icon_atom.dart';

class CatInfoSaveCatIconAtom extends CatInfoIconAtom {
  CatInfoSaveCatIconAtom({
    super.key,
    required ISaveCatLocallyUsecase usecase,
    required IShowToastAtom showToastAtom,
    required String url,
    required BuildContext context,
  }) : super(
          color: AppColors.secondary,
          icon: const FaIcon(Icons.download),
          onTap: () async {
            await _saveCatLocally(usecase, showToastAtom, url, context);
          },
        );

  static Future<void> _saveCatLocally(
    ISaveCatLocallyUsecase usecase,
    IShowToastAtom showToastAtom,
    String url,
    BuildContext context,
  ) async {
    final result = await usecase.call(SaveCatLocallyUsecaseParams(url: url));
    final toast = result.fold(
      (failure) => CatToastFailureAtom(
        text: AppStrings.saveCatLocallyFailure,
      ),
      (sucess) => CatToastSucessAtom(
        text: AppStrings.saveCatLocallySuccess,
      ),
    );
    if (context.mounted) {
      showToastAtom(context: context, toast: toast);
    }
  }
}
