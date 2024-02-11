import '../controller/forgot_password_verified_email_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ForgotPasswordVerifiedEmailScreen.
///
/// This class ensures that the ForgotPasswordVerifiedEmailController is created when the
/// ForgotPasswordVerifiedEmailScreen is first loaded.
class ForgotPasswordVerifiedEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotPasswordVerifiedEmailController());
  }
}
