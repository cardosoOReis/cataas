import 'package:flutter/material.dart';

import '../../../data/datasources/remote/default_get_cat_amount_datasource_imp.dart';
import '../../../data/datasources/remote/default_get_cat_by_id_datasource_imp.dart';
import '../../../data/datasources/remote/default_get_random_cat_datasource_imp.dart';
import '../../../data/datasources/remote/default_get_random_cat_with_params_datasource_imp.dart';
import '../../../data/repositories/get_cat_amount_repository_imp.dart';
import '../../../data/repositories/get_cat_by_id_repository_imp.dart';
import '../../../data/repositories/get_random_cat_repository_imp.dart';
import '../../../data/repositories/get_random_cat_with_params_repository_imp.dart';
import '../../../domain/usecases/get_cat_amount/get_cat_amount_usecase_imp.dart';
import '../../../domain/usecases/get_cat_by_id/get_cat_by_id_usecase_imp.dart';
import '../../../domain/usecases/get_random_cat/get_random_cat_usecase_imp.dart';
import '../../../domain/usecases/get_random_cat_with_params/get_random_cat_with_params_usecase_imp.dart';
import '../../auxiliar/color_palette.dart';
import '../../controller/cat_controller.dart';

class GetCatButton extends StatefulWidget {
  const GetCatButton({
    required this.id,
    required this.tag,
    required this.text,
    required this.textColor,
    required this.filter,
    Key? key,
  }) : super(key: key);

  final String id;
  final String text;
  final String textColor;
  final String tag;
  final String filter;

  @override
  State<GetCatButton> createState() => _GetCatButtonState();
}

class _GetCatButtonState extends State<GetCatButton> {
  CatController controller = CatController(
    GetRandomCatUsecaseImp(
      GetRandomCatRepositoryImp(
        DefaultGetRandomCatDatasourceImp(),
      ),
    ),
    GetCatByIdUsecaseImp(
      GetCatByIdRepositoryImp(
        DefaultGetCatByIdDatasourceImp(),
      ),
    ),
    GetRandomCatWithParamsUsecaseImp(
      GetRandomCatWithParamsRepositoryImp(
          DefaultGetRandomCatWithParamsDatasourceImp()),
    ),
    GetCatAmountUsecaseImp(
      GetCatAmountRepositoryImp(
        DefaultGetCatAmountDatasourceImp(),
      ),
    ),
  );

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
            setState(() {
              
              if (widget.text.isEmpty &&
                  widget.filter.isEmpty &&
                  widget.tag.isEmpty) {
                controller.getRandomCat();
              } else {
                controller.getRandomCatWithParams(
                  text: widget.text,
                  textColor: widget.textColor,
                  tag: widget.tag,
                  filter: widget.filter,
                );
              }
            });
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
