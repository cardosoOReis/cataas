import 'package:flutter/material.dart';

import '../../../domain/entities/cat.dart';
import '../atoms/cat_display_atom.dart';
import '../molecules/cat_info_molecule.dart';

class CatSucessOrganism extends StatelessWidget {
  final Cat cat;
  const CatSucessOrganism({
    required this.cat,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(child: CatDisplayAtom(cat: cat)),
          CatInfoMolecule(cat: cat),
        ],
      );
}
