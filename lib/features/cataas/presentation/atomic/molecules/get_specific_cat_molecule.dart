import 'package:cataas/core/extensions/string_extensions.dart';
import 'package:cataas/features/cataas/presentation/atomic/atoms/default_cat_text_field.dart';
import 'package:cataas/features/cataas/presentation/atomic/atoms/dropdown_filter_atom.dart';
import 'package:cataas/features/cataas/presentation/atomic/atoms/dropdown_search_type_atom.dart';
import 'package:cataas/features/cataas/presentation/atomic/atoms/get_cat_button_atom.dart';
import 'package:cataas/features/cataas/presentation/cubits/cat_cubit.dart';
import 'package:cataas/features/cataas/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetSpecificCatMolecule extends StatefulWidget {
  final void Function(String id) onGetCatByIdButtonTap;
  final void Function(String tag) onGetCatByTagButtonTap;
  final void Function(String?) onTextColorTextFieldValueChanged;
  final void Function(String?) onFilterFieldValueChanged;
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
                        title: state.searchType.buttonTitle,
                        backgroundColor: AppColors.terciary,
                        onTap: () {
                          switch (state.searchType) {
                            case SearchType.id:
                              return widget
                                  .onGetCatByIdButtonTap(_controller.text);
                            case SearchType.tag:
                              return widget
                                  .onGetCatByTagButtonTap(_controller.text);
                          }
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: DropdownSearchTypeAtom(
                          currentSearchType: state.searchType,
                          onChanged: _onChanged,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            DefaultCatTextField(
              labelText: state.searchType.label,
              hintText: state.searchType.hintText,
              onValueChanged: (_) {},
              controller: _controller,
            ),
            DropdownFilterAtom(
              onFilterFieldValueChanged: widget.onFilterFieldValueChanged,
            ),
          ],
        );
      },
    );
  }

  void _onChanged(SearchType? value) {
    _controller.clear();
    widget.onTypeOfSearchChange(value!);
  }
}
