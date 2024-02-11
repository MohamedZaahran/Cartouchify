import 'package:hierosecret/core/app_export.dart';
import 'package:hierosecret/presentation/home_onboarding_screen/models/home_onboarding_model.dart';

/// A controller class for the HomeOnboardingScreen.
///
/// This class manages the state of the HomeOnboardingScreen, including the
/// current homeOnboardingModelObj
class HomeOnboardingController extends GetxController {
  Rx<HomeOnboardingModel> homeOnboardingModelObj = HomeOnboardingModel().obs;
}
