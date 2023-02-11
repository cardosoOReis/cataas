import 'package:cataas/features/cataas/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';

class LoadingWidgetAtom extends StatelessWidget {
  const LoadingWidgetAtom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: AppColors.primary,
    );
  }
}
