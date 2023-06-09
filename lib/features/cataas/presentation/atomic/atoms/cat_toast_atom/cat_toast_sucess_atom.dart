import 'package:flutter/material.dart';

import '../../../../configs/app_colors.dart';
import 'cat_toast_atom.dart';

class CatToastSucessAtom extends CatToastAtom {
  const CatToastSucessAtom({
    super.key,
    required super.text,
  }) : super(
          color: AppColors.green,
          icon: const Icon(Icons.check),
        );
}
