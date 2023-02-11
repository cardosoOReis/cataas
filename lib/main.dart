import 'package:cataas/features/cataas/presentation/cubits/cat_cubit.dart';
import 'package:cataas/features/cataas/presentation/pages/cat_page.dart';
import 'package:cataas/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  initServices();
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => sl<CatCubit>(),
        child: CatPage(),
      ),
      title: 'Cat as a Service',
      theme: ThemeData(primaryColor: Color.fromRGBO(233, 84, 32, 1)),
    );
  }
}
