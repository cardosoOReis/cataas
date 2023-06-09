import 'package:flutter/material.dart';

import '../molecules/get_random_cat_molecule.dart';
import '../molecules/get_specific_cat_molecule.dart';

class CatControlsOrganism extends StatelessWidget {
  const CatControlsOrganism({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        GetRandomCatMolecule(),
        GetSpecificCatMolecule(),
      ],
    );
  }
}
