import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../configs/app_strings.dart';
import '../cat_toast_atom/cat_toast_atom.dart';
import '../show_toast_atom/i_show_toast_atom.dart';
import 'cat_info_icon_atom.dart';

class CatInfoCopyCatIdIconAtom extends CatInfoIconAtom {
  CatInfoCopyCatIdIconAtom({
    super.key,
    required IShowToastAtom showToastAtom,
    required String catId,
    required BuildContext context,
  }) : super(
          color: Colors.grey.shade300,
          icon: const FaIcon(Icons.copy),
          onTap: () async {
            showToastAtom(
              context: context,
              toast: CatToastAtom(
                text: AppStrings.copyCatIdSucess,
                icon: const Icon(Icons.copy),
                color: Colors.grey.shade300,
              ),
            );
            await Clipboard.setData(ClipboardData(text: catId));
          },
        );
}
