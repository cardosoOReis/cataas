import 'package:flutter/material.dart';

class GetCatButtonAtom extends StatelessWidget {
  final void Function() onTap;
  final String title;
  final Color backgroundColor;
  const GetCatButtonAtom({
    required this.onTap,
    required this.title,
    required this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 200,
        height: 40,
        child: ElevatedButton(
          onPressed: onTap,
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color>(backgroundColor),
          ),
          child: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
      );
}
