import 'package:flutter/material.dart';

import '../../../domain/entities/cat.dart';
import '../../../configs/app_strings.dart';
import 'loading_widget_atom.dart';

class CatDisplayAtom extends StatelessWidget {
  final Cat catEntity;
  const CatDisplayAtom({super.key, required this.catEntity});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      catEntity.url,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }

        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: LoadingWidgetAtom(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            AppStrings.getCatFailure,
          ),
        );
      },
    );
  }
}
