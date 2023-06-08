import 'package:cataas/features/cataas/presentation/atomic/atoms/cat_toast_atom/cat_toast_failure_atom.dart';
import 'package:cataas/features/cataas/presentation/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../service_locator.dart';
import '../../../usecases/i_share_cat_usecase.dart';
import '../../../utils/app_colors.dart';
import 'cat_info_icon_atom.dart';

class CatInfoShareCatIconAtom extends CatInfoIconAtom {
  CatInfoShareCatIconAtom({
    super.key,
    required String url,
    required BuildContext context,
  }) : super(
            color: AppColors.secondary,
            icon: const FaIcon(Icons.share),
            onTap: () async {
              final usecase = sl<IShareCatUsecase>();
              final result = await usecase(ShareCatUsecaseParams(url: url));
              result.fold(
                (failure) {
                  if (!context.mounted) return;
                  FToast().init(context).showToast(
                        child: CatToastFailureAtom(
                          text: AppStrings.shareCatFailure,
                        ),
                      );
                },
                (sucess) {
                  // Do nothing ¯\_(ツ)_/¯
                },
              );
            });
}
