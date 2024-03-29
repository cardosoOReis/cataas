import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../configs/app_colors.dart';
import '../../../../configs/app_strings.dart';
import '../../../usecases/i_share_cat_usecase.dart';
import '../cat_toast_atom/cat_toast_failure_atom.dart';
import '../show_toast_atom/i_show_toast_atom.dart';
import 'cat_info_icon_atom.dart';

class CatInfoShareCatIconAtom extends CatInfoIconAtom {
  CatInfoShareCatIconAtom({
    required IShareCatUsecase usecase,
    required IShowToastAtom showToastAtom,
    required String url,
    required BuildContext context,
    super.key,
  }) : super(
          color: AppColors.secondary,
          icon: const FaIcon(Icons.share),
          onTap: () async {
            await _shareCat(usecase, url, context, showToastAtom);
          },
        );

  static Future<void> _shareCat(
    IShareCatUsecase usecase,
    String url,
    BuildContext context,
    IShowToastAtom showToastAtom,
  ) async {
    final result = await usecase(ShareCatUsecaseParams(url: url));
    result.fold(
      (failure) {
        if (!context.mounted) return;
        const toast = CatToastFailureAtom(
          text: AppStrings.shareCatFailure,
        );
        showToastAtom(context: context, toast: toast);
      },
      (sucess) {
        // Do nothing ¯\_(ツ)_/¯
      },
    );
  }
}
