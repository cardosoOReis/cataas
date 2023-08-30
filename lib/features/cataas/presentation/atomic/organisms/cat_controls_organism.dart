import 'package:flutter/material.dart';

import '../molecules/get_random_cat_molecule.dart';
import '../molecules/get_specific_cat_molecule.dart';

class CatControlsOrganism extends StatelessWidget {
  const CatControlsOrganism({
    super.key,
  });

  @override
  Widget build(BuildContext context) => const Column(
        children: [
          GetRandomCatMolecule(),
          GetSpecificCatMolecule(),
        ],
      );
}
