import 'package:cataas/core/extensions/string_extensions.dart';
import 'package:flutter/material.dart';

class DropdownFilterAtom extends StatefulWidget {
  final void Function(String?) onFilterFieldValueChanged;

  const DropdownFilterAtom({
    Key? key,
    required this.onFilterFieldValueChanged,
  }) : super(key: key);

  @override
  State<DropdownFilterAtom> createState() => _DropdownFilterAtomState();
}

class _DropdownFilterAtomState extends State<DropdownFilterAtom> {
  String? _currentValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
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
        setState(() {
          _currentValue = filter;
        });
        widget.onFilterFieldValueChanged(filter);
      },
    );
  }
}

enum FilterValues { none, blur, mono, sepia, negative, paint, pixel }
