import 'package:flutter/material.dart';

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
    return SizedBox(
      width: 200,
      height: 40,
      child: ElevatedButton(
        onPressed: () => onTap(),
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
}
