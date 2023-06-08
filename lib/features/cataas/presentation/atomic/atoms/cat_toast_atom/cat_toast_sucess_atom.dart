import 'package:flutter/material.dart';

import 'cat_toast_atom.dart';

class CatToastSucessAtom extends CatToastAtom {
  const CatToastSucessAtom({
    super.key,
    required super.text,
  }) : super(
          color: Colors.greenAccent,
          icon: const Icon(Icons.check),
        );
}
