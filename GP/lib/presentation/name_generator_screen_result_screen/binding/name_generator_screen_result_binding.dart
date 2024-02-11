import '../controller/name_generator_screen_result_controller.dart';
import 'package:get/get.dart';

/// A binding class for the NameGeneratorScreenResultScreen.
///
/// This class ensures that the NameGeneratorScreenResultController is created when the
/// NameGeneratorScreenResultScreen is first loaded.
class NameGeneratorScreenResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NameGeneratorScreenResultController());
  }
}
