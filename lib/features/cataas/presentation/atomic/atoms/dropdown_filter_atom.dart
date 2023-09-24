import 'package:flutter/material.dart';

import '../../../../../core/extensions/string_extensions.dart';
import '../../../configs/app_colors.dart';
import '../../../domain/entities/filters.dart';

class DropdownFilterAtom extends StatefulWidget {
  final void Function(Filters) onFilterFieldValueChanged;

  const DropdownFilterAtom({
    required this.onFilterFieldValueChanged,
    super.key,
  });

  @override
  State<DropdownFilterAtom> createState() => _DropdownFilterAtomState();
}

class _DropdownFilterAtomState extends State<DropdownFilterAtom> {
  Filters _currentValue = Filters.none;

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
        items: Filters.values
            .map(
              (filter) => DropdownMenuItem(
                value: filter,
                child: Text(
                  switch (filter) {
                    Filters.none => 'Filters',
                    _ => filter.name.capitalize(),
                  },
                ),
              ),
            )
            .toList(),
        onChanged: (filter) {
          setState(() => _currentValue = filter!);
          widget.onFilterFieldValueChanged(filter!);
        },
        padding: const EdgeInsets.only(left: 4),
        alignment: Alignment.center,
        underline: const SizedBox.shrink(),
      ),
    );
  }
}
