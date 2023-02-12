import 'package:flutter/material.dart';

class DefaultCatTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final void Function(String) onValueChanged;
  final TextEditingController? controller;
  const DefaultCatTextField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.onValueChanged,
    this.controller,
  }) : super(key: key);

  @override
  State<DefaultCatTextField> createState() => _DefaultCatTextFieldState();
}

class _DefaultCatTextFieldState extends State<DefaultCatTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        // TODO -> Give border color to the text field
        border: const OutlineInputBorder(),
      ),
      onChanged: widget.onValueChanged,
    );
  }
}
