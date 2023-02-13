import 'package:cataas/features/cataas/presentation/atomic/atoms/saved_cat_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/app_colors.dart';
import '../atoms/cat_info_icon_atom.dart';

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
                Text(
                  'Cat ID: $catId',
                ),
                const SizedBox(
                  width: 10,
                ),
                CatInfoIconAtom(
                  onTap: () async {
                    await onCopyIconTap(context);
                  },
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

  Future<void> onCopyIconTap(BuildContext context) async {
    FToast()
      ..init(context)
      ..showToast(
        child: CatToast(
          text: 'Copied the Cat Id successfuly to the Clipboard!',
          icon: const Icon(Icons.copy),
          color: Colors.grey.shade300,
        ),
      );
    await Clipboard.setData(ClipboardData(text: catId));
  }
}
