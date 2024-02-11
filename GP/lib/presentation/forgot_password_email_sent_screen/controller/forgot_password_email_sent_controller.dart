import 'package:hierosecret/core/app_export.dart';
import 'package:hierosecret/presentation/forgot_password_email_sent_screen/models/forgot_password_email_sent_model.dart';

/// A controller class for the ForgotPasswordEmailSentScreen.
///
/// This class manages the state of the ForgotPasswordEmailSentScreen, including the
/// current forgotPasswordEmailSentModelObj
class ForgotPasswordEmailSentController extends GetxController {
  Rx<ForgotPasswordEmailSentModel> forgotPasswordEmailSentModelObj =
      ForgotPasswordEmailSentModel().obs;
}
