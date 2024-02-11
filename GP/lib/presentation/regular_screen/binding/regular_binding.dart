import '../controller/regular_controller.dart';
import 'package:get/get.dart';

/// A binding class for the RegularScreen.
///
/// This class ensures that the RegularController is created when the
/// RegularScreen is first loaded.
class RegularBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegularController());
  }
}
