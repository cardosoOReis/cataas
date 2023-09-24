import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../../../../../../core/services/open_url_on_browser/i_open_url_on_browser_service.dart';
import '../../../../configs/app_colors.dart';
import '../../../../configs/app_strings.dart';
import '../modal_paragraph_atom.dart';
import '../text_with_link_atom.dart';
import 'app_bar_icon_atom.dart';

class AppBarInfoIconAtom extends AppBarIconAtom {
  AppBarInfoIconAtom({
    required IOpenUrlOnBrowserService service,
    required BuildContext context,
    super.key,
  }) : super(
          icon: const FaIcon(
            Icons.info_outline,
            color: AppColors.white,
          ),
          onIconTap: () {
            const pageTitle = Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  AppStrings.title,
                  style: TextStyle(
                    fontSize: 22,
                    // fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            );
            final items = <Widget>[
              const ModalParagraphAtom(text: AppStrings.description),
              const ModalParagraphAtom(text: AppStrings.description2),
              TextWithLinkAtom(
                text: AppStrings.officialWebsiteLabel,
                link: AppStrings.officialWebsiteUrl,
                service: service,
              ),
            ]
                .map((w) => Column(children: [const SizedBox(height: 8), w]))
                .toList();

            WoltModalSheet.show(
              context: context,
              pageListBuilder: (_) => [
                WoltModalSheetPage.withCustomSliverList(
                  pageTitlePaddingTop: 0,
                  isTopBarVisibleWhenScrolled: false,
                  pageTitle: pageTitle,
                  sliverList: SliverList(
                    delegate: SliverChildListDelegate(items),
                  ),
                ),
              ],
            );
          },
        );
}
