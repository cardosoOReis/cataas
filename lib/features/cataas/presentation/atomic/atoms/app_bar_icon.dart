import 'package:flutter/material.dart';

class AppBarIcon extends StatelessWidget {
  final void Function() onIconTap;
  final Widget icon;
  const AppBarIcon({
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
