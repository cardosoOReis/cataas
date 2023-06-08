import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../service_locator.dart';
import '../../../usecases/i_save_cat_locally_usecase.dart';
import '../../../utils/app_colors.dart';
import 'cat_info_icon_atom.dart';

class CatInfoSaveCatIconAtom extends CatInfoIconAtom {
  CatInfoSaveCatIconAtom({
    super.key,
    required String url,
  }) : super(
            color: AppColors.secondary,
            icon: const FaIcon(Icons.download),
            onTap: () async {
              final usecase = sl<ISaveCatLocallyUsecase>();
              await usecase(SaveCatLocallyUsecaseParams(url: url));
            });
}
