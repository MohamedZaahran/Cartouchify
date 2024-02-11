import '../controller/scanning_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ScanningScreen.
///
/// This class ensures that the ScanningController is created when the
/// ScanningScreen is first loaded.
class ScanningBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScanningController());
  }
}
