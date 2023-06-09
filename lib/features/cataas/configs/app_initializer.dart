
import 'package:cataas/features/cataas/configs/service_locator.dart';

class AppInitializer {
  static Future<void> init() async {
    // Get It
    ServiceLocator.initServices();
  }
}