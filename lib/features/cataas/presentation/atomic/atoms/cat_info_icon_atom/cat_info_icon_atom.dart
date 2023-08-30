import 'package:flutter/material.dart';

class CatInfoIconAtom extends StatelessWidget {
  final Future<void> Function() onTap;
  final Color color;
  final Widget icon;
  const CatInfoIconAtom({
    required this.onTap,
    required this.color,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: SizedBox.square(
          dimension: 35,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            child: Center(
              child: icon,
            ),
          ),
        ),
      );
}
