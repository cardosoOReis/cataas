import 'package:cataas/service_locator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/services/open_url_on_browser/i_open_url_on_browser_service.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_strings.dart';
import 'app_bar_icon_atom.dart';

class AppBarBeerIconAtom extends AppBarIconAtom {
  AppBarBeerIconAtom({
    super.key,
  }) : super(
          icon: const FaIcon(
            FontAwesomeIcons.beerMugEmpty,
            color: AppColors.white,
          ),
          onIconTap: () async {
            final service = sl<IOpenUrlOnBrowserService>();
            await service(AppStrings.buyMeABeerUrl);
          },
        );
}
