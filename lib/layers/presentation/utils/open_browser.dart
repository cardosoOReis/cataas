import 'package:url_launcher/url_launcher.dart';

class OpenBrowser {
  static Future<void> execute(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }
}
