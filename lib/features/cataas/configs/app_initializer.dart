
import 'service_locator.dart';

class AppInitializer {
  static Future<void> init() async {
    // Get It
    ServiceLocator.initServices();
  }
}