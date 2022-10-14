import 'package:flutter/material.dart';
import 'package:shell/layers/data/datasources/remote/default_get_cat_amount_datasource_imp.dart';
import 'package:shell/layers/data/datasources/remote/default_get_random_cat_with_params_datasource_imp.dart';
import 'package:shell/layers/data/repositories/get_cat_amount_repository_imp.dart';
import 'package:shell/layers/data/repositories/get_random_cat_with_params_repository_imp.dart';
import 'package:shell/layers/domain/usecases/get_cat_amount/get_cat_amount_usecase_imp.dart';
import 'package:shell/layers/domain/usecases/get_random_cat_with_params/get_random_cat_with_params_usecase_imp.dart';
import 'package:shell/layers/presentation/widgets/appbar/default_appbar.dart';
import 'package:shell/layers/presentation/widgets/drawer/default_drawer.dart';

import '../../data/datasources/remote/default_get_cat_by_id_datasource_imp.dart';
import '../../data/datasources/remote/default_get_random_cat_datasource_imp.dart';
import '../../data/repositories/get_cat_by_id_repository_imp.dart';
import '../../data/repositories/get_random_cat_repository_imp.dart';
import '../../domain/entities/cat_entity.dart';
import '../../domain/usecases/get_cat_by_id/get_cat_by_id_usecase_imp.dart';
import '../../domain/usecases/get_random_cat/get_random_cat_usecase_imp.dart';
import '../controller/cat_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  final baseUrl = 'https://cataas.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppbar(),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * .8,
          height: MediaQuery.of(context).size.height * .8,
          color: Colors.red,
          child: FutureBuilder<CatEntity>(
            future: controller.getRandomCatWithParams(),
            builder: (context, snapshot) {
              List<Widget> children;
              if (snapshot.hasData) {
                children = [
                  Image.network('$baseUrl${snapshot.data!.url}'),
                  Text('ID: ${snapshot.data!.id}'),
                  Text('Created At: ${snapshot.data!.createdAt}'),
                  Text('Image ID: ${snapshot.data!.url}'),
                  if (snapshot.data!.text != null)
                    Text('Text: ${snapshot.data!.text}'),
                  if (snapshot.data!.textColor != null)
                    Text('Text Color: ${snapshot.data!.textColor}'),
                  if (snapshot.data!.tags!.isNotEmpty)
                    Text('Tags: ${snapshot.data!.tags}'),
                  if (snapshot.data!.filter != null)
                    Text('Filter: ${snapshot.data!.filter}')
                ];
              } else if (snapshot.hasError) {
                children = [
                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('Error: ${snapshot.error}'),
                  ),
                ];
              } else {
                children = const [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: CircularProgressIndicator(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text('Awaiting result...'),
                  ),
                ];
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              );
            },
          ),
        ),
      ),
      drawer: DefaultDrawer(),
    );
  }
}
