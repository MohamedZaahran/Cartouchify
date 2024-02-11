import 'package:hierosecret/core/app_export.dart';
import 'package:hierosecret/presentation/explore_places_screen/models/explore_places_model.dart';

/// A controller class for the ExplorePlacesScreen.
///
/// This class manages the state of the ExplorePlacesScreen, including the
/// current explorePlacesModelObj
class ExplorePlacesController extends GetxController {
  Rx<ExplorePlacesModel> explorePlacesModelObj = ExplorePlacesModel().obs;
}
