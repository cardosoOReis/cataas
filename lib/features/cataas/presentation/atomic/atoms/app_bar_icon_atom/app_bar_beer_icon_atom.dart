import 'package:cataas/core/services/open_url_on_browser/i_open_url_on_browser_service.dart';
import 'package:cataas/features/cataas/presentation/atomic/atoms/app_bar_icon_atom/app_bar_icon_atom.dart';
import 'package:cataas/features/cataas/presentation/utils/app_colors.dart';
import 'package:cataas/features/cataas/presentation/utils/app_strings.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarBeerIconAtom extends AppBarIconAtom {
  AppBarBeerIconAtom({
    super.key,
    required IOpenUrlOnBrowserService service,
  }) : super(
          icon: const FaIcon(
            FontAwesomeIcons.beerMugEmpty,
            color: AppColors.white,
          ),
          onIconTap: () async => await service(AppStrings.buyMeABeerUrl),
        );
}
