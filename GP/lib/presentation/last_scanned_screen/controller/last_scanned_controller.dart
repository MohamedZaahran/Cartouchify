import 'package:hierosecret/core/app_export.dart';
import 'package:hierosecret/presentation/last_scanned_screen/models/last_scanned_model.dart';

/// A controller class for the LastScannedScreen.
///
/// This class manages the state of the LastScannedScreen, including the
/// current lastScannedModelObj
class LastScannedController extends GetxController {
  Rx<LastScannedModel> lastScannedModelObj = LastScannedModel().obs;
}
