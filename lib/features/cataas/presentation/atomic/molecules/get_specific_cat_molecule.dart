import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/cat_cubit.dart';
import '../../utils/app_colors.dart';
import '../atoms/default_cat_text_field.dart';
import '../atoms/dropdown_filter_atom.dart';
import '../atoms/get_cat_button_atom.dart';

class GetSpecificCatMolecule extends StatefulWidget {
  final void Function(String value) onGetCatByIdOrTagButtonTap;
  final void Function(String?) onFilterFieldValueChanged;
  const GetSpecificCatMolecule({
    Key? key,
    required this.onGetCatByIdOrTagButtonTap,
    required this.onFilterFieldValueChanged,
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
                        onTap: () => widget.onGetCatByIdOrTagButtonTap(_controller.text),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            DefaultCatTextField(
              labelText: state.searchType.label,
              hintText: state.searchType.hintText,
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
}
