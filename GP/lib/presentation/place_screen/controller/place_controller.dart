import 'package:hierosecret/core/app_export.dart';
import 'package:hierosecret/presentation/place_screen/models/place_model.dart';

/// A controller class for the PlaceScreen.
///
/// This class manages the state of the PlaceScreen, including the
/// current placeModelObj
class PlaceController extends GetxController {
  Rx<PlaceModel> placeModelObj = PlaceModel().obs;
}
