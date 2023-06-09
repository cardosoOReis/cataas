import 'package:flutter/material.dart';

import '../../../configs/app_strings.dart';
import '../../../domain/entities/cat.dart';
import 'loading_widget_atom.dart';

class CatDisplayAtom extends StatelessWidget {
  final Cat cat;
  const CatDisplayAtom({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      cat.url,
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
        return const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(AppStrings.getCatFailure),
        );
      },
    );
  }
}
