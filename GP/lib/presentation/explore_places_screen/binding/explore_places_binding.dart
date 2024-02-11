import '../controller/explore_places_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ExplorePlacesScreen.
///
/// This class ensures that the ExplorePlacesController is created when the
/// ExplorePlacesScreen is first loaded.
class ExplorePlacesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExplorePlacesController());
  }
}
