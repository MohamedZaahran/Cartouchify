import '../../../core/app_export.dart';

/// This class is used in the [cardslist_item_widget] screen.
class CardslistItemModel {
  CardslistItemModel({
    this.about,
    this.id,
  }) {
    about = about ?? Rx("About : Biggest & Newest Museam in Egypt");
    id = id ?? Rx("");
  }

  Rx<String>? about;

  Rx<String>? id;
}
