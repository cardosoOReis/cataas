import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../auxiliar/color_palette.dart';
import '../../bloc/cataas_bloc.dart';
import '../../controller/cat_controller.dart';

class GetCatButton extends StatefulWidget {
  const GetCatButton({
    required this.bloc,
    this.id,
    this.tag,
    this.text,
    this.textColor,
    this.filter,
    Key? key,
  }) : super(key: key);

  final CataasBloc bloc;
  final String? id;
  final String? text;
  final String? textColor;
  final String? tag;
  final String? filter;

  @override
  State<GetCatButton> createState() => _GetCatButtonState();
}

class _GetCatButtonState extends State<GetCatButton> {
  CatController controller = GetIt.instance<CatController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      height: 48,
      margin: const EdgeInsets.symmetric(vertical: 50),
      child: Material(
        color: ColorPalette.sucessColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          onTap: () {
            if (widget.text == null &&
                widget.filter == null &&
                widget.tag == null) {
              widget.bloc.add(GetRandomCatEvent());
            } else {
              widget.bloc.add(GetRandomCatWithParamsEvent(
                text: widget.text,
                textColor: widget.textColor,
                tag: widget.tag,
                filter: widget.filter,
              ));
            }
          },
          child: const Center(
            child: Text(
              "Give me a Cat 🐱",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          ),
        ),
      ),
    );
  }
}
