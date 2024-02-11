import '../controller/forgot_password_email_sent_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ForgotPasswordEmailSentScreen.
///
/// This class ensures that the ForgotPasswordEmailSentController is created when the
/// ForgotPasswordEmailSentScreen is first loaded.
class ForgotPasswordEmailSentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotPasswordEmailSentController());
  }
}
