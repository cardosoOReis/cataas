import 'package:cataas/features/cataas/presentation/pages/cat_page.dart';
import 'package:cataas/service_locator.dart';
import 'package:flutter/material.dart';

void main() {
  initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CatPage(),
      title: 'Cat as a Service',
      theme: ThemeData(primaryColor: Color.fromRGBO(233, 84, 32, 1)),
    );
  }
}
