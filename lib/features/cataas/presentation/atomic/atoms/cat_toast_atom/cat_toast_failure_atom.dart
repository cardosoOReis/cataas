import 'package:cataas/features/cataas/presentation/atomic/atoms/cat_toast_atom/cat_toast_atom.dart';
import 'package:flutter/material.dart';

class CatToastFailureAtom extends CatToastAtom {
  const CatToastFailureAtom({
    super.key,
    required super.text,
  }) : super(
          color: Colors.redAccent,
          icon: const Icon(Icons.error),
        );
}
