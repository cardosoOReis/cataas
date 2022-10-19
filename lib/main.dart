import 'package:flutter/material.dart';

import 'core/inject/inject.dart';
import 'layers/presentation/pages/main_page.dart';

void main() {
  Inject.init();
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    debugShowCheckedModeBanner: false,
    home: const HomePage(),
  ));
}
