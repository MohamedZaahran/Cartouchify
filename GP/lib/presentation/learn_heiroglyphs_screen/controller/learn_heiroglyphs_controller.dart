import 'package:hierosecret/core/app_export.dart';
import 'package:hierosecret/presentation/learn_heiroglyphs_screen/models/learn_heiroglyphs_model.dart';

/// A controller class for the LearnHeiroglyphsScreen.
///
/// This class manages the state of the LearnHeiroglyphsScreen, including the
/// current learnHeiroglyphsModelObj
class LearnHeiroglyphsController extends GetxController {
  Rx<LearnHeiroglyphsModel> learnHeiroglyphsModelObj =
      LearnHeiroglyphsModel().obs;
}
