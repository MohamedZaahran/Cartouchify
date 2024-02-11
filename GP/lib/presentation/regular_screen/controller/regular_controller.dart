import 'package:hierosecret/core/app_export.dart';
import 'package:hierosecret/presentation/regular_screen/models/regular_model.dart';

/// A controller class for the RegularScreen.
///
/// This class manages the state of the RegularScreen, including the
/// current regularModelObj
class RegularController extends GetxController {
  Rx<RegularModel> regularModelObj = RegularModel().obs;
}
