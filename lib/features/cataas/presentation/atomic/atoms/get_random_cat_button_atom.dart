import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class GetRandomCatButtonAtom extends StatelessWidget {
  final void Function() onTap;
  final String title;
  final Color backgroundColor;
  const GetRandomCatButtonAtom({
    super.key,
    required this.onTap,
    required this.title,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTap(),
      child: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(backgroundColor),
      ),
    );
  }
}
