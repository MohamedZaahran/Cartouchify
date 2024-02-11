import '../controller/home_onboarding_controller.dart';
import 'package:get/get.dart';

/// A binding class for the HomeOnboardingScreen.
///
/// This class ensures that the HomeOnboardingController is created when the
/// HomeOnboardingScreen is first loaded.
class HomeOnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeOnboardingController());
  }
}
