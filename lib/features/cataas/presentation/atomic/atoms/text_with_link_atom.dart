import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../core/services/open_url_on_browser/i_open_url_on_browser_service.dart';
import '../../../configs/app_colors.dart';

class TextWithLinkAtom extends StatelessWidget {
  final String text;
  final String link;
  final IOpenUrlOnBrowserService service;
  const TextWithLinkAtom({
    required this.text,
    required this.link,
    required this.service,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: link,
              recognizer: TapGestureRecognizer()..onTap = () => service(link),
              style: const TextStyle(
                color: AppColors.textLink,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
        style: const TextStyle(
          fontSize: 16,
          color: AppColors.black,
        ),
      );
}
