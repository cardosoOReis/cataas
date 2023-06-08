import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/cat_cubit.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
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
                        title: AppStrings.getCatByIdOrTag,
                        backgroundColor: AppColors.terciary,
                        onTap: () =>
                            widget.onGetCatByIdOrTagButtonTap(_controller.text),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: DefaultCatTextField(
                    labelText: 'Id or Tag',
                    hintText: "Get a cat based on it's id or tag",
                    controller: _controller,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: DropdownFilterAtom(
                    onFilterFieldValueChanged: widget.onFilterFieldValueChanged,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
