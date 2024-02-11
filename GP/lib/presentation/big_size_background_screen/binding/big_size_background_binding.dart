import '../controller/big_size_background_controller.dart';
import 'package:get/get.dart';

/// A binding class for the BigSizeBackgroundScreen.
///
/// This class ensures that the BigSizeBackgroundController is created when the
/// BigSizeBackgroundScreen is first loaded.
class BigSizeBackgroundBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BigSizeBackgroundController());
  }
}
