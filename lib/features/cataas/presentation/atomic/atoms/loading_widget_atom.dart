import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class LoadingWidgetAtom extends StatelessWidget {
  final double? value;
  const LoadingWidgetAtom({Key? key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.primary,
        value: value,
      ),
    );
  }
}
