import 'package:cataas/features/cataas/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';

class MessaageDisplayAtom extends StatelessWidget {
  final String message;
  const MessaageDisplayAtom({Key? key, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.white,
      child: Text(message),
    );
  }
}
