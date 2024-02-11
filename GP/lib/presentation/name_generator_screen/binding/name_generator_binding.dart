import '../controller/name_generator_controller.dart';
import 'package:get/get.dart';

/// A binding class for the NameGeneratorScreen.
///
/// This class ensures that the NameGeneratorController is created when the
/// NameGeneratorScreen is first loaded.
class NameGeneratorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NameGeneratorController());
  }
}
