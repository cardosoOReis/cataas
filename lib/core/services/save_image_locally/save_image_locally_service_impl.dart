import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

import '../../error/exceptions.dart';
import 'i_save_image_locally_service.dart';

class SaveImageLocallyServiceImpl implements ISaveImageLocallyService {
  const SaveImageLocallyServiceImpl();

  @override
  Future<void> saveImage({required String url}) async {
    if (!FlutterDownloader.initialized) {
      await FlutterDownloader.initialize(debug: true);
    }
    try {
      final result = await FlutterDownloader.enqueue(
        url: url,
        savedDir: '/storage/emulated/0/Download',
        saveInPublicStorage: true,
      );

      if (result == null) {
        throw const SaveCatLocallyException();
      }

      return;
    } on PlatformException {
      throw const SaveCatLocallyException();
    }
  }
}
