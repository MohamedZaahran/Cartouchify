import '../../../core/app_export.dart';

/// This class is used in the [cardcomponent_item_widget] screen.
class CardcomponentItemModel {
  CardcomponentItemModel({
    this.placeName,
    this.date,
    this.museumName,
    this.museumDate,
    this.id,
  }) {
    placeName = placeName ?? Rx("Place :");
    date = date ?? Rx("Date :");
    museumName = museumName ?? Rx("Grand Egyptian Museum (GEM)");
    museumDate = museumDate ?? Rx("20/2/2024");
    id = id ?? Rx("");
  }

  Rx<String>? placeName;

  Rx<String>? date;

  Rx<String>? museumName;

  Rx<String>? museumDate;

  Rx<String>? id;
}
