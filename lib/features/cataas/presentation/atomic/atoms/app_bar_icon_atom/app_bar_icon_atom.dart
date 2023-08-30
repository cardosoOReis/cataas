import 'package:flutter/material.dart';

class AppBarIconAtom extends StatelessWidget {
  final void Function() onIconTap;
  final Widget icon;
  const AppBarIconAtom({
    required this.onIconTap,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onIconTap,
        child: icon,
      );
}
