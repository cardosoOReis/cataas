import 'package:flutter/material.dart';

import '../../../configs/service_locator.dart';
import '../../../domain/entities/cat.dart';
import '../../usecases/i_save_cat_locally_usecase.dart';
import '../../usecases/i_share_cat_usecase.dart';
import '../atoms/cat_info_icon_atom/cat_info_save_cat_icon_atom.dart';
import '../atoms/cat_info_icon_atom/cat_info_share_cat_icon_atom.dart';
import '../atoms/show_toast_atom/i_show_toast_atom.dart';
import 'copy_cat_id_molecule.dart';

class CatInfoMolecule extends StatelessWidget {
  final Cat cat;
  const CatInfoMolecule({required this.cat, super.key});

  @override
  Widget build(BuildContext context) {
    final showToastAtom = sl<IShowToastAtom>();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.maxFinite,
      height: 50,
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(width: 2)),
      ),
      child: Row(
        children: [
          Expanded(
            child: CopyCatIdMolecule(
              id: cat.id,
              showToastAtom: showToastAtom,
            ),
          ),
          CatInfoShareCatIconAtom(
            usecase: sl<IShareCatUsecase>(),
            showToastAtom: showToastAtom,
            url: cat.url,
            context: context,
          ),
          const SizedBox(width: 10),
          CatInfoSaveCatIconAtom(
            usecase: sl<ISaveCatLocallyUsecase>(),
            showToastAtom: showToastAtom,
            url: cat.url,
            context: context,
          ),
        ],
      ),
    );
  }
}
