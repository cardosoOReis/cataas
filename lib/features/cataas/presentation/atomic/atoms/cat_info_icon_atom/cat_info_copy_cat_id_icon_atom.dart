import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utils/app_strings.dart';
import '../cat_toast.dart';
import 'cat_info_icon_atom.dart';

class CatInfoCopyCatIdIconAtom extends CatInfoIconAtom {
  CatInfoCopyCatIdIconAtom({
    super.key,
    required BuildContext context,
    required String catId,
  }) : super(
          color: Colors.grey.shade300,
          icon: const FaIcon(Icons.copy),
          onTap: () async {
            FToast().init(context).showToast(
                  child: CatToast(
                    text: AppStrings.copyCatIdSucess,
                    icon: const Icon(Icons.copy),
                    color: Colors.grey.shade300,
                  ),
                );
            await Clipboard.setData(ClipboardData(text: catId));
          },
        );
}
