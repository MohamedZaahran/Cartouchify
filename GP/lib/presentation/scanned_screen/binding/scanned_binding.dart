import '../controller/scanned_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ScannedScreen.
///
/// This class ensures that the ScannedController is created when the
/// ScannedScreen is first loaded.
class ScannedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScannedController());
  }
}
