import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import '../atoms/default_cat_text_field.dart';
import '../atoms/get_cat_button_atom.dart';
import '../molecules/get_specific_cat_molecule.dart';

class CatControlsOrganism extends StatelessWidget {
  final void Function() onGetRandomCatButtonTap;
  final void Function(String value) onGetCatByIdOrTagButtonTap;
  final void Function(String text) onTextTextFieldChanged;
  final void Function(String?) onFilterFieldValueChanged;
  const CatControlsOrganism({
    Key? key,
    required this.onGetRandomCatButtonTap,
    required this.onGetCatByIdOrTagButtonTap,
    required this.onTextTextFieldChanged,
    required this.onFilterFieldValueChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: GetCatButtonAtom(
            onTap: onGetRandomCatButtonTap,
            title: AppStrings.getRandomCat,
            backgroundColor: AppColors.primary,
          ),
        ),
        DefaultCatTextField(
          labelText: 'Text',
          hintText: 'Add some text to your cat image.',
          onValueChanged: onTextTextFieldChanged,
        ),
        GetSpecificCatMolecule(
          onGetCatByIdOrTagButtonTap: onGetCatByIdOrTagButtonTap,
          onFilterFieldValueChanged: onFilterFieldValueChanged,
        ),
      ],
    );
  }
}
