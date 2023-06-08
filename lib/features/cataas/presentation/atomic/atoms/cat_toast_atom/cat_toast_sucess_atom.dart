import 'package:cataas/features/cataas/presentation/atomic/atoms/cat_toast_atom/cat_toast_atom.dart';
import 'package:flutter/material.dart';

class CatToastSucessAtom extends CatToastAtom {
  const CatToastSucessAtom({
    super.key,
    required super.text,
  }) : super(
          color: Colors.greenAccent,
          icon: const Icon(Icons.check),
        );
}
