import 'package:cataas/features/cataas/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CatInfoMolecule extends StatelessWidget {
  final String catId;
  final void Function(String url) onShareCatIconTap;
  final void Function(String url) onSaveCatIconTap;
  const CatInfoMolecule({
    Key? key,
    required this.catId,
    required this.onShareCatIconTap,
    required this.onSaveCatIconTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.maxFinite,
      height: 50,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Cat ID: $catId',
            ),
          ),
          InkWell(
            onTap: () {},
            child: const SizedBox.square(
              dimension: 35,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Center(
                  child: FaIcon(
                    Icons.share,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {},
            child: const SizedBox.square(
              dimension: 35,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Center(
                  child: FaIcon(
                    Icons.download,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
