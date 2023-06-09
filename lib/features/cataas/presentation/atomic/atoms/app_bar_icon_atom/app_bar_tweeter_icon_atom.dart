import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/services/open_url_on_browser/i_open_url_on_browser_service.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_strings.dart';
import 'app_bar_icon_atom.dart';

class AppBarTweeterIconAtom extends AppBarIconAtom {
  AppBarTweeterIconAtom({
    super.key,
    required IOpenUrlOnBrowserService service,
  }) : super(
          icon: const FaIcon(
            FontAwesomeIcons.twitter,
            color: AppColors.white,
          ),
          onIconTap: () async {
            await service(AppStrings.twitterUrl);
          },
        );
}