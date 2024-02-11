import 'package:hierosecret/core/app_export.dart';
import 'package:hierosecret/presentation/scanned_screen/models/scanned_model.dart';

/// A controller class for the ScannedScreen.
///
/// This class manages the state of the ScannedScreen, including the
/// current scannedModelObj
class ScannedController extends GetxController {
  Rx<ScannedModel> scannedModelObj = ScannedModel().obs;
}
