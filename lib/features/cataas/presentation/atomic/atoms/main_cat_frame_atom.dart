import 'package:flutter/material.dart';

import '../../../configs/app_colors.dart';

class MainCatFrameAtom extends StatelessWidget {
  final Widget child;

  const MainCatFrameAtom({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.black,
            spreadRadius: 6,
          ),
          BoxShadow(
            color: AppColors.white,
            spreadRadius: 4,
          ),
          BoxShadow(
            color: AppColors.black,
            spreadRadius: 2,
          ),
          BoxShadow(
            color: AppColors.white,
          ),
        ],
      ),
      child: child,
    );
  }
}
