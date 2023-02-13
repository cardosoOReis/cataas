import 'package:cataas/core/extensions/string_extensions.dart';
import 'package:cataas/features/cataas/presentation/atomic/atoms/default_cat_text_field.dart';
import 'package:cataas/features/cataas/presentation/atomic/atoms/get_cat_button_atom.dart';
import 'package:cataas/features/cataas/presentation/cubits/cat_cubit.dart';
import 'package:cataas/features/cataas/presentation/utils/app_colors.dart';
import 'package:cataas/features/cataas/presentation/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetSpecificCatMolecule extends StatefulWidget {
  final void Function(String id) onGetCatByIdButtonTap;
  final void Function(String tag) onGetCatByTagButtonTap;
  final void Function(String) onTextColorTextFieldValueChanged;
  final void Function(String) onFilterFieldValueChanged;
  final void Function(SearchType) onTypeOfSearchChange;
  const GetSpecificCatMolecule({
    Key? key,
    required this.onGetCatByIdButtonTap,
    required this.onGetCatByTagButtonTap,
    required this.onTextColorTextFieldValueChanged,
    required this.onFilterFieldValueChanged,
    required this.onTypeOfSearchChange,
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
    return BlocBuilder<CatCubit, CatState>(
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SizedBox(
                width: double.maxFinite,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: GetCatButtonAtom(
                        onTap: state.searchType.isId
                            ? () =>
                                widget.onGetCatByIdButtonTap(_controller.text)
                            : () =>
                                widget.onGetCatByTagButtonTap(_controller.text),
                        title: state.searchType.isId
                            ? AppStrings.getCatById
                            : AppStrings.getCatByTag,
                        backgroundColor: AppColors.terciary,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: DropdownButton(
                              value: state.searchType,
                              alignment: Alignment.center,
                              underline: const SizedBox(),
                              onChanged: onChanged,
                              items: SearchType.values
                                  .map(
                                    (searchType) =>
                                        DropdownMenuItem<SearchType>(
                                      value: searchType,
                                      child: Text(
                                        searchType.name.capitalize(),
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            DefaultCatTextField(
              labelText: state.searchType.isId
                  ? AppStrings.getCatByIdLabel
                  : AppStrings.getCatByTagLabel,
              hintText: state.searchType.isId
                  ? AppStrings.getCatByIdHintText
                  : AppStrings.getCatByTagHintText,
              onValueChanged: (_) {},
              controller: _controller,
            ),
          ],
        );
      },
    );
  }

  void onChanged(SearchType? value) {
    _controller.clear();
    widget.onTypeOfSearchChange(value!);
  }
}
