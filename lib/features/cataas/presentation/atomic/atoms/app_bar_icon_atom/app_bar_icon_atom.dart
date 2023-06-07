import 'package:flutter/material.dart';

class AppBarIconAtom extends StatelessWidget {
  final void Function() onIconTap;
  final Widget icon;
  const AppBarIconAtom({
    Key? key,
    required this.onIconTap,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onIconTap,
      child: icon,
    );
  }
}
