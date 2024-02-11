import 'package:hierosecret/core/app_export.dart';
import 'package:hierosecret/presentation/big_size_background_screen/models/big_size_background_model.dart';

/// A controller class for the BigSizeBackgroundScreen.
///
/// This class manages the state of the BigSizeBackgroundScreen, including the
/// current bigSizeBackgroundModelObj
class BigSizeBackgroundController extends GetxController {
  Rx<BigSizeBackgroundModel> bigSizeBackgroundModelObj =
      BigSizeBackgroundModel().obs;
}
