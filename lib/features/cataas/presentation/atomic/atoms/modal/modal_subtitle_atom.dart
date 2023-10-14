import 'package:flutter/material.dart';

class ModalSubtitleAtom extends StatelessWidget {
  final String title;
  const ModalSubtitleAtom({required this.title, super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
}
