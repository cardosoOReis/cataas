import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/open_url_on_browser/i_open_url_on_browser_service.dart';
import '../../../../service_locator.dart';
import '../atomic/atoms/app_bar_icon/app_bar_beer_icon.dart';
import '../atomic/atoms/app_bar_icon/app_bar_icon.dart';
import '../atomic/atoms/app_bar_icon/app_bar_tweeter_icon.dart';
import '../atomic/templates/main_page_template.dart';
import '../cubits/cat_cubit.dart';
import '../utils/app_strings.dart';

class CatPage extends StatelessWidget {
  const CatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CatCubit>(context);
    final appBarIcons = <AppBarIcon>[
      AppBarBeerIcon(service: sl<IOpenUrlOnBrowserService>()),
      AppBarTweeterIcon(service: sl<IOpenUrlOnBrowserService>()),
    ];

    return MainPageTemplate(
      title: AppStrings.title,
      appBarIcons: appBarIcons,
      onGetRandomCatButtonTap: cubit.onGetRandomCatButtonTap,
      onGetCatByIdOrTagButtonTap: cubit.onGetCatByIdOrTagButtonTap,
      onTextTextFieldValueChanged: cubit.onTextTextFieldValueChanged,
      onFilterFieldValueChanged: cubit.onFilterTextFieldValueChanged,
      onSaveCatIconTap: cubit.onSaveCatIconTap,
      onShareCatIconTap: cubit.onShareCatIconTap,
    );
  }
}
