import 'package:flutter/material.dart';

import 'cat_toast_atom.dart';

class CatToastFailureAtom extends CatToastAtom {
  const CatToastFailureAtom({
    super.key,
    required super.text,
  }) : super(
          color: Colors.redAccent,
          icon: const Icon(Icons.error),
        );
}
