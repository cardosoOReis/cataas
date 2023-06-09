import 'package:flutter/material.dart';

import '../../../../core/services/open_url_on_browser/i_open_url_on_browser_service.dart';
import '../../configs/app_strings.dart';
import '../../configs/service_locator.dart';
import '../atomic/atoms/app_bar_icon_atom/app_bar_beer_icon_atom.dart';
import '../atomic/atoms/app_bar_icon_atom/app_bar_icon_atom.dart';
import '../atomic/atoms/app_bar_icon_atom/app_bar_tweeter_icon_atom.dart';
import '../atomic/templates/main_page_template.dart';

class CatPage extends StatelessWidget {
  const CatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final openUrlOnBrowserService = sl<IOpenUrlOnBrowserService>();
    final appBarIcons = <AppBarIconAtom>[
      AppBarBeerIconAtom(service: openUrlOnBrowserService),
      AppBarTweeterIconAtom(service: openUrlOnBrowserService),
    ];

    return MainPageTemplate(
      title: AppStrings.title,
      appBarIcons: appBarIcons,
    );
  }
}
