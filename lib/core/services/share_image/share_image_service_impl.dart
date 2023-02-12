import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../../error/exceptions.dart';
import 'i_share_image_service.dart';

class ShareImageServiceImpl implements IShareImageService {
  @override
  Future<void> call({required String url}) async {
    try {
      await Share.share(url);
    } on Exception catch (e) {
      debugPrint(e.toString());
      throw const ShareCatException();
    }
  }
}
