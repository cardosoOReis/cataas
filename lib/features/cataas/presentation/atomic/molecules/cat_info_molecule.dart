import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/app_colors.dart';
import '../atoms/cat_info_icon_atom.dart';

class CatInfoMolecule extends StatelessWidget {
  final String catId;
  final String url;
  final void Function(String url) onShareCatIconTap;
  final void Function(String url) onSaveCatIconTap;
  final void Function() onCopyCatIconTap;
  const CatInfoMolecule({
    Key? key,
    required this.catId,
    required this.onShareCatIconTap,
    required this.onSaveCatIconTap,
    required this.url,
    required this.onCopyCatIconTap,
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
            child: Row(
              children: [
                Text(
                  'Cat ID: $catId',
                ),
                const SizedBox(
                  width: 10,
                ),
                CatInfoIconAtom(
                  onTap: onCopyCatIconTap,
                  color: Colors.grey.shade300,
                  icon: const FaIcon(Icons.copy),
                ),
              ],
            ),
          ),
          CatInfoIconAtom(
            onTap: () => onShareCatIconTap(url),
            color: AppColors.secondary,
            icon: const FaIcon(Icons.share),
          ),
          const SizedBox(
            width: 10,
          ),
          CatInfoIconAtom(
            onTap: () => onSaveCatIconTap(url),
            color: AppColors.secondary,
            icon: const FaIcon(Icons.download),
          ),
        ],
      ),
    );
  }
}
