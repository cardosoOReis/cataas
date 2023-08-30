import 'package:flutter/material.dart';

class CatTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final void Function(String)? onValueChanged;
  final TextEditingController? controller;
  const CatTextField({
    required this.labelText,
    required this.hintText,
    super.key,
    this.onValueChanged,
    this.controller,
  });

  @override
  State<CatTextField> createState() => _CatTextFieldState();
}

class _CatTextFieldState extends State<CatTextField> {
  @override
  Widget build(BuildContext context) => TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText,
          border: const OutlineInputBorder(),
        ),
        onChanged: widget.onValueChanged,
      );
}
