import '../controller/scanning_screen_black_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ScanningScreenBlackScreen.
///
/// This class ensures that the ScanningScreenBlackController is created when the
/// ScanningScreenBlackScreen is first loaded.
class ScanningScreenBlackBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScanningScreenBlackController());
  }
}
