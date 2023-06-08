import 'package:flutter/material.dart';

import '../cat_toast_atom/cat_toast_atom.dart';

abstract interface class IShowToastAtom {
  void call({required BuildContext context, required CatToastAtom toast});
}
