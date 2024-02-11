import 'package:hierosecret/core/app_export.dart';
import 'package:hierosecret/presentation/scanning_screen_black_screen/models/scanning_screen_black_model.dart';

/// A controller class for the ScanningScreenBlackScreen.
///
/// This class manages the state of the ScanningScreenBlackScreen, including the
/// current scanningScreenBlackModelObj
class ScanningScreenBlackController extends GetxController {
  Rx<ScanningScreenBlackModel> scanningScreenBlackModelObj =
      ScanningScreenBlackModel().obs;
}
