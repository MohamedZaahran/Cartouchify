import '../../../core/app_export.dart';
import 'homeonegrid_item_model.dart';

/// This class defines the variables used in the [home_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class HomeOneModel {
  Rx<List<HomeonegridItemModel>> homeonegridItemList = Rx([
    HomeonegridItemModel(dynamicText: "Name Generator".obs),
    HomeonegridItemModel(dynamicText: "Explore Places ".obs),
    HomeonegridItemModel(dynamicText: "Last Scanned".obs),
    HomeonegridItemModel(dynamicText: "Learn \nHeiroglyphs".obs)
  ]);
}
