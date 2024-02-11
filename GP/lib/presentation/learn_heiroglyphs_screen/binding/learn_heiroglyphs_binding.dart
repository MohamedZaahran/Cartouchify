import '../controller/learn_heiroglyphs_controller.dart';
import 'package:get/get.dart';

/// A binding class for the LearnHeiroglyphsScreen.
///
/// This class ensures that the LearnHeiroglyphsController is created when the
/// LearnHeiroglyphsScreen is first loaded.
class LearnHeiroglyphsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LearnHeiroglyphsController());
  }
}
