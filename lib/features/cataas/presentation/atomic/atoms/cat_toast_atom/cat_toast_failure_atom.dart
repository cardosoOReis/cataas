import 'package:flutter/material.dart';

import '../../../../configs/app_colors.dart';
import 'cat_toast_atom.dart';

class CatToastFailureAtom extends CatToastAtom {
  const CatToastFailureAtom({
    required super.text,
    super.key,
  }) : super(
          color: AppColors.red,
          icon: const Icon(Icons.error),
        );
}
