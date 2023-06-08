import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../cat_toast_atom/cat_toast_atom.dart';
import 'i_show_toast_atom.dart';

class ShowToastAtomImpl implements IShowToastAtom {
  @override
  void call({
    required BuildContext context,
    required CatToastAtom toast,
  }) {
    FToast().init(context).showToast(child: toast);
  }
}
