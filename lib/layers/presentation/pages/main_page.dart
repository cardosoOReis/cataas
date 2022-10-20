import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../domain/entities/cat_entity.dart';
import '../bloc/cataas_bloc.dart';
import '../controller/cat_controller.dart';
import '../widgets/appbar/default_appbar.dart';
import '../widgets/drawer/default_drawer.dart';
import '../widgets/get_cat_button/get_cat_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final CataasBloc bloc;
  CatController controller = GetIt.instance<CatController>();
  final baseUrl = 'https://cataas.com';

  @override
  void initState() {
    super.initState();
    bloc = CataasBloc();
    bloc.add(GetRandomCatWithParamsEvent(text: 'Hello again! :D'));
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppbar(),
      body: Center(
        child: Column(
          children: [
            GetCatButton(bloc: bloc),
            Container(
              width: MediaQuery.of(context).size.width * .8,
              color: Colors.red,
              child: BlocBuilder<CataasBloc, CataasState>(
                bloc: bloc,
                builder: (context, state) {
                  List<Widget> children;
                  if (state is CataasSucessState) {
                    final CatEntity catEntity = state.catEntity!;
                    children = [
                      Image.network('$baseUrl${catEntity.url}'),
                      Text('ID: ${catEntity.id}'),
                      Text('Created At: ${catEntity.createdAt}'),
                      Text('Image Url: $baseUrl${catEntity.url}'),
                      if (catEntity.text != null)
                        Text('Text: ${catEntity.text}'),
                      if (catEntity.textColor != null && catEntity.text != null)
                        Text('Text Color: ${catEntity.textColor}'),
                      if (catEntity.tags!.isNotEmpty)
                        Text('Tags: ${catEntity.tags}'),
                      if (catEntity.filter != null)
                        Text('Filter: ${catEntity.filter}')
                    ];
                  } else if (state is CataasErrorState) {
                    String? exceptionResponse = state.message;
                    String response;
                    if (exceptionResponse == 'Exception: 404') {
                      response =
                          "We couldn't find this cat, sorry 😿. Please try again!";
                    } else {
                      response =
                          'Sorry, we commited a mistake 😿. Please try again later!';
                    }
                    children = [
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text(response),
                      ),
                    ];
                  } else {
                    children = const [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
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
          ],
        ),
      ),
      drawer: DefaultDrawer(),
    );
  }
}
