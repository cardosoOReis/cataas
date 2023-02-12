import 'package:cataas/features/cataas/presentation/atomic/atoms/default_cat_text_field.dart';
import 'package:cataas/features/cataas/presentation/atomic/atoms/get_cat_button_atom.dart';
import 'package:cataas/features/cataas/presentation/utils/app_colors.dart';
import 'package:cataas/features/cataas/presentation/utils/app_strings.dart';
import 'package:flutter/material.dart';

class GetSpecificCatMolecule extends StatefulWidget {
  final void Function(String id) onGetCatByIdButtonTap;
  final void Function(String tag) onGetCatByTagButtonTap;
  final void Function(String) onTextColorTextFieldValueChanged;
  final void Function(String) onFilterFieldValueChanged;
  final void Function() onTypeOfSearchChange;
  final bool isSearchingById;
  const GetSpecificCatMolecule({
    Key? key,
    required this.onGetCatByIdButtonTap,
    required this.onGetCatByTagButtonTap,
    required this.onTextColorTextFieldValueChanged,
    required this.onFilterFieldValueChanged,
    required this.onTypeOfSearchChange,
    required this.isSearchingById,
  }) : super(key: key);

  @override
  State<GetSpecificCatMolecule> createState() => _GetSpecificCatMoleculeState();
}

class _GetSpecificCatMoleculeState extends State<GetSpecificCatMolecule> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isSearchingById = widget.isSearchingById;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: GetCatButtonAtom(
            onTap: isSearchingById
                ? () => widget.onGetCatByIdButtonTap(_controller.text)
                : () => widget.onGetCatByTagButtonTap(_controller.text),
            title: isSearchingById
                ? AppStrings.getCatById
                : AppStrings.getCatByTag,
            backgroundColor: AppColors.terciary,
          ),
        ),
        DefaultCatTextField(
          labelText: isSearchingById
              ? AppStrings.getCatByIdLabel
              : AppStrings.getCatByTagLabel,
          hintText: '',
          onValueChanged: (_) {},
          controller: _controller,
        ),
      ],
    );
  }
}
