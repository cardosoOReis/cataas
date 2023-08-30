import 'package:flutter/material.dart';

import '../../../configs/app_colors.dart';

class LoadingWidgetAtom extends StatelessWidget {
  final double? value;
  const LoadingWidgetAtom({super.key, this.value});

  @override
  Widget build(BuildContext context) => Center(
        child: CircularProgressIndicator(
          color: AppColors.primary,
          value: value,
        ),
      );
}
