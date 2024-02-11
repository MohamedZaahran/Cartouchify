import '../controller/register_wrong_inputs_controller.dart';
import 'package:get/get.dart';

/// A binding class for the RegisterWrongInputsScreen.
///
/// This class ensures that the RegisterWrongInputsController is created when the
/// RegisterWrongInputsScreen is first loaded.
class RegisterWrongInputsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterWrongInputsController());
  }
}
