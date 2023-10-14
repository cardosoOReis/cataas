import 'package:flutter/material.dart';

class ModalTitleAtom extends StatelessWidget {
  final String title;

  const ModalTitleAtom({required this.title, super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(title, style: const TextStyle(fontSize: 22)),
      );
}
