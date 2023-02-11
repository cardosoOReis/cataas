import 'package:cataas/features/cataas/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';

class MessageDisplayAtom extends StatelessWidget {
  final String message;
  const MessageDisplayAtom({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Center(
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
