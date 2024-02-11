import '../controller/place_controller.dart';
import 'package:get/get.dart';

/// A binding class for the PlaceScreen.
///
/// This class ensures that the PlaceController is created when the
/// PlaceScreen is first loaded.
class PlaceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PlaceController());
  }
}
