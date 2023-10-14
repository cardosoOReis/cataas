import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../../../../../../core/extensions/function_extensions.dart';
import '../../../../../../core/services/open_url_on_browser/i_open_url_on_browser_service.dart';
import '../../../../configs/app_colors.dart';
import '../../../../configs/app_strings.dart';
import '../../molecules/copy_cat_id_molecule.dart';
import '../get_cat_button_atom/get_random_cat_button_atom.dart';
import '../modal/modal_paragraph_atom.dart';
import '../modal/modal_strings.dart';
import '../modal/modal_subtitle_atom.dart';
import '../modal/modal_title_atom.dart';
import '../show_toast_atom/i_show_toast_atom.dart';
import '../text_with_link_atom.dart';
import 'app_bar_icon_atom.dart';

class AppBarInfoIconAtom extends AppBarIconAtom {
  AppBarInfoIconAtom({
    required IOpenUrlOnBrowserService service,
    required BuildContext context,
    required IShowToastAtom showToastAtom,
    super.key,
  }) : super(
          icon: const FaIcon(
            Icons.info_outline,
            color: AppColors.white,
          ),
          onIconTap: () => _openModal(service, context, showToastAtom),
        );

  static void _openModal(
    IOpenUrlOnBrowserService service,
    BuildContext context,
    IShowToastAtom showToastAtom,
  ) {
    const pageTitle = Center(child: ModalTitleAtom(title: AppStrings.title));
    final items = <Widget>[
      const ModalParagraphAtom(text: ModalStrings.description),
      const ModalParagraphAtom(text: ModalStrings.description2),
      TextWithLinkAtom(
        text: ModalStrings.officialWebsiteLabel,
        link: AppStrings.officialWebsiteUrl,
        service: service,
      ),
      const ModalSubtitleAtom(title: ModalStrings.howItWorksTitle),
      const ModalParagraphAtom(text: ModalStrings.howItWorksDescription1),
      const GetRandomCatButtonAtom(onTap: voidFunction),
      const ModalParagraphAtom(text: ModalStrings.howItWorksDescription2),
      Center(
        child: CopyCatIdMolecule(
          id: AppStrings.defaultCatId,
          showToastAtom: showToastAtom,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
      const ModalParagraphAtom(text: ModalStrings.howItWorksDescription3),
      const ModalParagraphAtom(text: ModalStrings.howItWorksDescription4),
    ].map((w) => Column(children: [const SizedBox(height: 12), w])).toList();

    WoltModalSheet.show(
      context: context,
      pageListBuilder: (_) => [
        WoltModalSheetPage.withCustomSliverList(
          pageTitlePaddingTop: 0,
          isTopBarVisibleWhenScrolled: false,
          pageTitle: pageTitle,
          sliverList: SliverList(delegate: SliverChildListDelegate(items)),
        ),
      ],
    );
  }
}
