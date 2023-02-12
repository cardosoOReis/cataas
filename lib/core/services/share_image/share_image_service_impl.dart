import 'package:cataas/core/error/exceptions.dart';
import 'package:cataas/core/services/share_image/i_share_image_service.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

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
