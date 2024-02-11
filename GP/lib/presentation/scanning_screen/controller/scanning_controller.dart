import 'package:hierosecret/core/app_export.dart';
import 'package:hierosecret/presentation/scanning_screen/models/scanning_model.dart';

/// A controller class for the ScanningScreen.
///
/// This class manages the state of the ScanningScreen, including the
/// current scanningModelObj
class ScanningController extends GetxController {
  Rx<ScanningModel> scanningModelObj = ScanningModel().obs;
}
