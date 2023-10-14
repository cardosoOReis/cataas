import 'package:flutter/material.dart';

import '../atoms/cat_info_icon_atom/cat_info_copy_cat_id_icon_atom.dart';
import '../atoms/show_toast_atom/i_show_toast_atom.dart';

class CopyCatIdMolecule extends StatelessWidget {
  final String id;
  final IShowToastAtom showToastAtom;
  final MainAxisAlignment mainAxisAlignment;
  const CopyCatIdMolecule({
    required this.id,
    required this.showToastAtom,
    this.mainAxisAlignment = MainAxisAlignment.start,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          Text('Cat ID: $id'),
          const SizedBox(width: 10),
          CatInfoCopyCatIdIconAtom(
            showToastAtom: showToastAtom,
            context: context,
            catId: id,
          ),
        ],
      );
}
