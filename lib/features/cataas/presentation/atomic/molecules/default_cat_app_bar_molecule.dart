import 'package:cataas/features/cataas/presentation/atomic/atoms/app_bar_icon.dart';
import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class DefaultCatAppBarMolecule extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final List<AppBarIcon>? icons;

  const DefaultCatAppBarMolecule({
    Key? key,
    required this.title,
    this.icons,
  }) : super(key: key);

  final double preferredSizeHeight = 117;
  final double appBarHeight = 72;

  @override
  Widget build(BuildContext context) {
    final safeAreaHeight = MediaQuery.of(context).padding.top;

    return SizedBox(
      height: safeAreaHeight + appBarHeight,
      child: ColoredBox(
        color: AppColors.primary,
        child: Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: safeAreaHeight,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 22,
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ...?icons,
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(preferredSizeHeight);
}