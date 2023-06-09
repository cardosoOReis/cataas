import 'package:flutter/material.dart';

import '../../../configs/service_locator.dart';
import '../atoms/cat_info_icon_atom/cat_info_copy_cat_id_icon_atom.dart';
import '../atoms/cat_info_icon_atom/cat_info_save_cat_icon_atom.dart';
import '../atoms/cat_info_icon_atom/cat_info_share_cat_icon_atom.dart';
import '../atoms/show_toast_atom/i_show_toast_atom.dart';

class CatInfoMolecule extends StatelessWidget {
  final String catId;
  final String url;
  const CatInfoMolecule({
    Key? key,
    required this.catId,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final showToastAtom = sl<IShowToastAtom>();
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
                  showToastAtom: showToastAtom,
                  context: context,
                  catId: catId,
                ),
              ],
            ),
          ),
          CatInfoShareCatIconAtom(
            usecase: sl(),
            showToastAtom: showToastAtom,
            url: url,
            context: context,
          ),
          const SizedBox(width: 10),
          CatInfoSaveCatIconAtom(
            usecase: sl(),
            showToastAtom: showToastAtom,
            url: url,
            context: context,
          ),
        ],
      ),
    );
  }
}
