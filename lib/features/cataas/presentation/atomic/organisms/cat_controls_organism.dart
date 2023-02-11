import 'package:cataas/features/cataas/presentation/atomic/atoms/default_cat_text_field.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../atoms/get_random_cat_button_atom.dart';

class CatControlsOrganism extends StatefulWidget {
  final void Function() onGetRandomCatButtonTap;
  final void Function(String text) onTextTextFieldChanged;
  const CatControlsOrganism({
    Key? key,
    required this.onGetRandomCatButtonTap,
    required this.onTextTextFieldChanged,
  }) : super(key: key);

  @override
  State<CatControlsOrganism> createState() => _CatControlsOrganismState();
}

class _CatControlsOrganismState extends State<CatControlsOrganism> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          DefaultCatTextField(
            labelText: 'Text',
            hintText: 'Add some text to your cat image.',
            onValueChanged: widget.onTextTextFieldChanged,
          ),
        ],
      ),
    );
  }
}
