import 'package:cataas/core/extensions/string_extensions.dart';
import 'package:cataas/features/cataas/presentation/cubits/cat_cubit.dart';
import 'package:flutter/material.dart';

class DropdownSearchTypeAtom extends StatefulWidget {
  final SearchType currentSearchType;
  final void Function(SearchType?) onChanged;
  const DropdownSearchTypeAtom({
    Key? key,
    required this.currentSearchType,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<DropdownSearchTypeAtom> createState() => _DropdownSearchTypeAtomState();
}

class _DropdownSearchTypeAtomState extends State<DropdownSearchTypeAtom> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: DropdownButton(
          value: widget.currentSearchType,
          alignment: Alignment.center,
          underline: const SizedBox(),
          onChanged: widget.onChanged,
          items: SearchType.values
              .map(
                (searchType) => DropdownMenuItem<SearchType>(
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
    );
  }
}
