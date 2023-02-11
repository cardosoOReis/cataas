import 'package:cataas/features/cataas/domain/entities/cat_entity.dart';
import 'package:flutter/material.dart';

class CatDisplayAtom extends StatelessWidget {
  final CatEntity catEntity;
  const CatDisplayAtom({super.key, required this.catEntity});

  @override
  Widget build(BuildContext context) {
    return Image.network(catEntity.url);
  }
}
