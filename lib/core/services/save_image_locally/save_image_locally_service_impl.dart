import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';

import '../../error/exceptions.dart';
import 'i_save_image_locally_service.dart';

class SaveImageLocallyServiceImpl implements ISaveImageLocallyService {
  const SaveImageLocallyServiceImpl();

  @override
  Future<void> saveImage({required String url}) async {
    try {
      final result = await ImageDownloader.downloadImage(url);

      if (result == null) {
        throw const SaveCatLocallyException();
      }

      return;
    } on PlatformException {
      throw const SaveCatLocallyException();
    }
  }
}
