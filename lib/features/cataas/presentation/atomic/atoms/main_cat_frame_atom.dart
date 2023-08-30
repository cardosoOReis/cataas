import 'package:flutter/material.dart';

import '../../../configs/app_colors.dart';

class MainCatFrameAtom extends StatelessWidget {
  final Widget child;

  const MainCatFrameAtom({required this.child, super.key});

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              spreadRadius: 6,
            ),
            BoxShadow(
              color: AppColors.white,
              spreadRadius: 4,
            ),
            BoxShadow(
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
