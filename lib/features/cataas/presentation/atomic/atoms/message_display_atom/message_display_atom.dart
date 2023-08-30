import 'package:flutter/material.dart';

class MessageDisplayAtom extends StatelessWidget {
  final String message;
  const MessageDisplayAtom({required this.message, super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      );
}
