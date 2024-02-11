import '../../../core/app_export.dart';

/// This class is used in the [homeonegrid_item_widget] screen.
class HomeonegridItemModel {
  HomeonegridItemModel({
    this.dynamicText,
    this.id,
  }) {
    dynamicText = dynamicText ?? Rx("Name Generator");
    id = id ?? Rx("");
  }

  Rx<String>? dynamicText;

  Rx<String>? id;
}
