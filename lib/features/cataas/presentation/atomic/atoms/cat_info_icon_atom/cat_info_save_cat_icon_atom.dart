import 'package:cataas/features/cataas/presentation/atomic/atoms/cat_toast_atom/cat_toast_failure_atom.dart';
import 'package:cataas/features/cataas/presentation/atomic/atoms/cat_toast_atom/cat_toast_sucess_atom.dart';
import 'package:cataas/features/cataas/presentation/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../service_locator.dart';
import '../../../usecases/i_save_cat_locally_usecase.dart';
import '../../../utils/app_colors.dart';
import 'cat_info_icon_atom.dart';

class CatInfoSaveCatIconAtom extends CatInfoIconAtom {
  CatInfoSaveCatIconAtom({
    super.key,
    required BuildContext context,
    required String url,
  }) : super(
          color: AppColors.secondary,
          icon: const FaIcon(Icons.download),
          onTap: () async {
            await _saveCatLocally(url, context);
          },
        );

  static Future<void> _saveCatLocally(String url, BuildContext context) async {
    final usecase = sl<ISaveCatLocallyUsecase>();
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
      FToast().init(context).showToast(child: toast);
    }
  }
}
