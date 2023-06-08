import 'package:flutter/material.dart';

import '../atoms/cat_info_icon_atom/cat_info_copy_cat_id_icon_atom.dart';
import '../atoms/cat_info_icon_atom/cat_info_save_cat_icon_atom.dart';
import '../atoms/cat_info_icon_atom/cat_info_share_cat_icon_atom.dart';

class CatInfoMolecule extends StatelessWidget {
  final String catId;
  final String url;
  final void Function(String url) onShareCatIconTap;
  final void Function(String url) onSaveCatIconTap;
  const CatInfoMolecule({
    Key? key,
    required this.catId,
    required this.onShareCatIconTap,
    required this.onSaveCatIconTap,
    required this.url,
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
                Text('Cat ID: $catId'),
                const SizedBox(width: 10),
                CatInfoCopyCatIdIconAtom(
                  context: context,
                  catId: catId,
                ),
              ],
            ),
          ),
          CatInfoShareCatIconAtom(url: url),
          const SizedBox(width: 10),
          CatInfoSaveCatIconAtom(url: url),
        ],
      ),
    );
  }
}
