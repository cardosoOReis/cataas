import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../configs/app_colors.dart';
import '../../../../configs/app_strings.dart';
import '../cat_toast_atom/cat_toast_atom.dart';
import '../show_toast_atom/i_show_toast_atom.dart';
import 'cat_info_icon_atom.dart';

class CatInfoCopyCatIdIconAtom extends CatInfoIconAtom {
  CatInfoCopyCatIdIconAtom({
    required IShowToastAtom showToastAtom,
    required String catId,
    required BuildContext context,
    super.key,
  }) : super(
          color: AppColors.lightGrey,
          icon: const FaIcon(Icons.copy),
          onTap: () async {
            showToastAtom(
              context: context,
              toast: CatToastAtom(
                text: AppStrings.copyCatIdSucess,
                icon: const Icon(Icons.copy),
                color: AppColors.lightGrey,
              ),
            );
            await Clipboard.setData(ClipboardData(text: catId));
          },
        );
}
