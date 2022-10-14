import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:shell/layers/presentation/auxiliar/color_palette.dart';

import '../../functions/open_browser.dart';

class DefaultAppbar extends StatelessWidget implements PreferredSizeWidget {

  const DefaultAppbar({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return AppBar(
        title: const Text('Cat as a Service',
            style: TextStyle(color: Colors.white)),
        backgroundColor: ColorPalette.primaryColor,
        actions: [
          IconButton(
              onPressed: () {
                OpenBrowser.execute(Uri.parse('https://twitter.com/apicataas'));
              },
              icon: const Icon(FontAwesome.twitter)),
          IconButton(
              onPressed: () {
                OpenBrowser.execute(Uri(
                    scheme: 'https',
                    host: 'www.buymeacoffee.com',
                    path: 'kevinbalicot'));
              },
              icon: const Icon(FontAwesome.beer)),
        ],
      );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}