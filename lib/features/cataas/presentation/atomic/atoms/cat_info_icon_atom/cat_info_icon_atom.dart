import 'package:flutter/material.dart';

class CatInfoIconAtom extends StatelessWidget {
  final void Function() onTap;
  final Color color;
  final Widget icon;
  const CatInfoIconAtom({
    Key? key,
    required this.onTap,
    required this.color,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
}
