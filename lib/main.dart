import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

import 'features/cataas/presentation/cubits/cat_cubit.dart';
import 'features/cataas/presentation/pages/cat_page.dart';
import 'service_locator.dart';

void main() {
  initServices();
  _initLogger();
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => _initCubit(),
        child: const CatPage(),
      ),
      title: 'Cat as a Service',
      theme: ThemeData(primaryColor: const Color.fromRGBO(233, 84, 32, 1)),
    );
  }

  CatCubit _initCubit() {
    final cubit = sl<CatCubit>();
    cubit.onInit();

    return cubit;
  }
}

void _initLogger() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    debugPrint('${record.level.name}: ${record.time}: ${record.message}');
  });
}
