import 'package:flutter/material.dart';

class ModalParagraphAtom extends StatelessWidget {
  final String text;
  const ModalParagraphAtom({required this.text, super.key});

  @override
  Widget build(BuildContext context) =>
      Text(text, style: const TextStyle(fontSize: 16));
}
