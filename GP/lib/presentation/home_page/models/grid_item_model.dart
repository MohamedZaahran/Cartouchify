import '../../../core/app_export.dart';

/// This class is used in the [grid_item_widget] screen.
class GridItemModel {
  GridItemModel({
    this.nameGeneratorImage,
    this.nameGeneratorText,
    this.id,
  }) {
    nameGeneratorImage =
        nameGeneratorImage ?? Rx(ImageConstant.imgEgyptianHierog);
    nameGeneratorText = nameGeneratorText ?? Rx("Name Generator");
    id = id ?? Rx("");
  }

  Rx<String>? nameGeneratorImage;

  Rx<String>? nameGeneratorText;

  Rx<String>? id;
}
