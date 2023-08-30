import 'package:flutter/material.dart';

import '../../../../../core/extensions/string_extensions.dart';
import '../../../configs/app_colors.dart';

class DropdownFilterAtom extends StatefulWidget {
  final void Function(String?) onFilterFieldValueChanged;

  const DropdownFilterAtom({
    required this.onFilterFieldValueChanged,
    super.key,
  });

  @override
  State<DropdownFilterAtom> createState() => _DropdownFilterAtomState();
}

class _DropdownFilterAtomState extends State<DropdownFilterAtom> {
  String? _currentValue;

  @override
  Widget build(BuildContext context) {
    const dropdownBorderRadius = 3.0;

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey),
        borderRadius: BorderRadius.circular(dropdownBorderRadius),
      ),
      child: DropdownButton(
        value: _currentValue,
        hint: const Text('Filters'),
        items: FilterValues.values
            .map(
              (filter) => DropdownMenuItem(
                value: filter.name,
                child: Text(
                  filter.name.capitalize(),
                ),
              ),
            )
            .toList(),
        onChanged: (filter) {
          setState(() => _currentValue = filter);
          widget.onFilterFieldValueChanged(filter);
        },
        alignment: Alignment.center,
        underline: const SizedBox.shrink(),
      ),
    );
  }
}

enum FilterValues { none, blur, mono, sepia, negative, paint, pixel }
