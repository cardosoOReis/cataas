import 'package:cataas/features/cataas/presentation/atomic/molecules/get_specific_cat_molecule.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import '../atoms/default_cat_text_field.dart';
import '../atoms/get_cat_button_atom.dart';

class CatControlsOrganism extends StatelessWidget {
  final void Function() onGetRandomCatButtonTap;
  final void Function(String id) onGetCatByIdButtonTap;
  final void Function(String tag) onGetCatByTagButtonTap;
  final void Function(String text) onTextTextFieldChanged;
  final void Function(String) onTextColorTextFieldValueChanged;
  final void Function(String) onFilterFieldValueChanged;
  final void Function() onTypeOfSearchChange;
  final bool isSearchingById;
  const CatControlsOrganism({
    Key? key,
    required this.onGetRandomCatButtonTap,
    required this.onTextTextFieldChanged,
    required this.onGetCatByIdButtonTap,
    required this.onGetCatByTagButtonTap,
    required this.onTextColorTextFieldValueChanged,
    required this.onFilterFieldValueChanged,
    required this.onTypeOfSearchChange,
    required this.isSearchingById,
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
          onGetCatByIdButtonTap: onGetCatByIdButtonTap,
          onGetCatByTagButtonTap: onGetCatByTagButtonTap,
          onTextColorTextFieldValueChanged: onTextColorTextFieldValueChanged,
          onFilterFieldValueChanged: onFilterFieldValueChanged,
          onTypeOfSearchChange: onTypeOfSearchChange,
          isSearchingById: isSearchingById,
        ),
      ],
    );
  }
}
