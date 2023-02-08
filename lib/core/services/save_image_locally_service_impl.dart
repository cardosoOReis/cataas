import 'package:image_downloader/image_downloader.dart';

import '../error/exceptions.dart';
import 'i_save_image_locally_service.dart';

class SaveImageLocallyServiceImpl implements ISaveImageLocallyService {
  @override
  Future<void> saveImage({required String url}) async {
    try {
      final result = await ImageDownloader.downloadImage(url);

      if (result == null) {
        throw const SaveCatLocallyException();
      }

      return;
    } catch (_) {
      throw const SaveCatLocallyException();
    }
  }
}
