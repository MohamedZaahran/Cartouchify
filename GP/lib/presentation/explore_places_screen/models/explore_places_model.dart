import '../../../core/app_export.dart';
import 'cardslist_item_model.dart';

/// This class defines the variables used in the [explore_places_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ExplorePlacesModel {
  Rx<List<CardslistItemModel>> cardslistItemList = Rx([
    CardslistItemModel(about: "About : Biggest & Newest Museam in Egypt".obs),
    CardslistItemModel(about: "About : Biggest & Newest Museam in Egypt".obs),
    CardslistItemModel(about: "About : Biggest & Newest Museam in Egypt".obs),
    CardslistItemModel(about: "About : Biggest & Newest Museam in Egypt".obs),
    CardslistItemModel(about: "About : Biggest & Newest Museam in Egypt".obs)
  ]);
}
