import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../configs/app_colors.dart';
import '../../../configs/app_strings.dart';
import '../../cubits/cat_cubit.dart';
import '../atoms/cat_text_field/cat_id_or_tag_text_field.dart';
import '../atoms/dropdown_filter_atom.dart';
import '../atoms/get_cat_button_atom.dart';

class GetSpecificCatMolecule extends StatefulWidget {
  const GetSpecificCatMolecule({Key? key}) : super(key: key);

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
    final cubit = BlocProvider.of<CatCubit>(context);

    return BlocBuilder<CatCubit, CatState>(
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: GetCatButtonAtom(
                title: AppStrings.getCatByIdOrTag,
                backgroundColor: AppColors.terciary,
                onTap: () => cubit.onGetCatByIdOrTagButtonTap(_controller.text),
              ),
            ),
            Row(
              children: [
                Expanded(child: CatIdOrTagTextField(controller: _controller)),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: DropdownFilterAtom(
                    onFilterFieldValueChanged:
                        cubit.onFilterTextFieldValueChanged,
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
