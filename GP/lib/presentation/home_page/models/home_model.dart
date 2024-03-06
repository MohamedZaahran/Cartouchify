import 'slider_item_model.dart';
import '../../../core/app_export.dart';
import 'grid_item_model.dart';

/// This class defines the variables used in the [home_page],
/// and is typically used to hold data that is passed between different parts of the application.
class HomeModel {
  Rx<List<SliderItemModel>> sliderItemList =
      Rx<List<SliderItemModel>>(List.generate(1, (index) => SliderItemModel(imagePath: ImageConstant.imgTut2023Paid)));

  Rx<List<GridItemModel>> gridItemList = Rx<List<GridItemModel>>([
    GridItemModel(
        nameGeneratorImage: ImageConstant.imgEgyptianHierog.obs,
        nameGeneratorText: "Name Generator".obs),
    GridItemModel(
        nameGeneratorImage: ImageConstant.imgPanoramaOfCairo.obs,
        nameGeneratorText: "Explore Places".obs),
    GridItemModel(
        nameGeneratorImage: ImageConstant.imgArafedManTaki.obs,
        nameGeneratorText: "Last Scanned".obs),
    GridItemModel(
        nameGeneratorImage: ImageConstant.imgHieroglyphsGet.obs,
        nameGeneratorText: "Learn Heiroglyphs".obs)
  ]);
}
