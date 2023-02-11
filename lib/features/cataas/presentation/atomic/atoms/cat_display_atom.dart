import 'package:flutter/material.dart';

import '../../../domain/entities/cat_entity.dart';
import 'loading_widget_atom.dart';

class CatDisplayAtom extends StatelessWidget {
  final CatEntity catEntity;
  const CatDisplayAtom({super.key, required this.catEntity});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      catEntity.url,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }

        return LoadingWidgetAtom(
          value: loadingProgress.expectedTotalBytes != null
              ? loadingProgress.cumulativeBytesLoaded /
                  loadingProgress.expectedTotalBytes!
              : null,
        );
      },
    );
  }
}
