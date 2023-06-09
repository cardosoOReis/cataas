import 'package:flutter/material.dart';

import '../../../configs/app_colors.dart';
import '../../../configs/service_locator.dart';
import '../../../domain/entities/cat.dart';
import '../atoms/cat_info_icon_atom/cat_info_copy_cat_id_icon_atom.dart';
import '../atoms/cat_info_icon_atom/cat_info_save_cat_icon_atom.dart';
import '../atoms/cat_info_icon_atom/cat_info_share_cat_icon_atom.dart';
import '../atoms/show_toast_atom/i_show_toast_atom.dart';

class CatInfoMolecule extends StatelessWidget {
  final Cat cat;
  const CatInfoMolecule({Key? key, required this.cat}) : super(key: key);

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
            color: AppColors.black,
            width: 2,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Text('Cat ID: ${cat.id}'),
                const SizedBox(width: 10),
                CatInfoCopyCatIdIconAtom(
                  showToastAtom: showToastAtom,
                  context: context,
                  catId: cat.id,
                ),
              ],
            ),
          ),
          CatInfoShareCatIconAtom(
            usecase: sl(),
            showToastAtom: showToastAtom,
            url: cat.url,
            context: context,
          ),
          const SizedBox(width: 10),
          CatInfoSaveCatIconAtom(
            usecase: sl(),
            showToastAtom: showToastAtom,
            url: cat.url,
            context: context,
          ),
        ],
      ),
    );
  }
}
