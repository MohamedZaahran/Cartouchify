import '../controller/last_scanned_controller.dart';
import 'package:get/get.dart';

/// A binding class for the LastScannedScreen.
///
/// This class ensures that the LastScannedController is created when the
/// LastScannedScreen is first loaded.
class LastScannedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LastScannedController());
  }
}
