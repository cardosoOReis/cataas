import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../service_locator.dart';
import '../../../usecases/i_share_cat_usecase.dart';
import '../../../utils/app_colors.dart';
import 'cat_info_icon_atom.dart';

class CatInfoShareCatIconAtom extends CatInfoIconAtom {
  CatInfoShareCatIconAtom({
    super.key,
    required String url,
  }) : super(
            color: AppColors.secondary,
            icon: const FaIcon(Icons.share),
            onTap: () async {
              final usecase = sl<IShareCatUsecase>();
              await usecase(ShareCatUsecaseParams(url: url));
            });
}
