import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/cataas/configs/app_colors.dart';
import 'features/cataas/configs/app_initializer.dart';
import 'features/cataas/configs/app_strings.dart';
import 'features/cataas/configs/service_locator.dart';
import 'features/cataas/presentation/cubits/cat_cubit.dart';
import 'features/cataas/presentation/pages/cat_page.dart';

void main() async {
  await AppInitializer.init();
  WidgetsFlutterBinding.ensureInitialized();
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
      title: AppStrings.title,
      theme: ThemeData(primaryColor: AppColors.primary),
    );
  }

  CatCubit _initCubit() {
    final cubit = sl<CatCubit>();
    cubit.onInit();

    return cubit;
  }
}
