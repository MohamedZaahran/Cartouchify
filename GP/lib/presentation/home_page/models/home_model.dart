import 'slider_item_model.dart';
import '../../../core/app_export.dart';
import 'grid_item_model.dart';

class HomeModel {
  late Rx<List<SliderItemModel>> sliderItemList;
  late Rx<List<GridItemModel>> gridItemList;

  HomeModel() {
    sliderItemList = Rx<List<SliderItemModel>>(
      List.generate(
        1,
        (index) => SliderItemModel(imagePath: ImageConstant.imgTut2023Paid),
      ),
    );

    // Add another image to the sliderItemList
    sliderItemList.value.add(
      SliderItemModel(imagePath: ImageConstant.imgHistoryOfGrandEgyMueseum),
    );

    sliderItemList.value.add(
      SliderItemModel(imagePath: ImageConstant.imgAncientEgyptianGarden),
    );

    sliderItemList.value.add(
      SliderItemModel(imagePath: ImageConstant.imgDiscoverAncientEgyptian),
    );

    gridItemList = Rx<List<GridItemModel>>([
      GridItemModel(
        nameGeneratorImage: ImageConstant.imgEgyptianHierog.obs,
        nameGeneratorText: "Name Generator".obs,
      ),
      GridItemModel(
        nameGeneratorImage: ImageConstant.imgPanoramaOfCairo.obs,
        nameGeneratorText: "Explore Places".obs,
      ),
      GridItemModel(
        nameGeneratorImage: ImageConstant.imgArafedManTaki.obs,
        nameGeneratorText: "Last Scanned".obs,
      ),
      GridItemModel(
        nameGeneratorImage: ImageConstant.imgHieroglyphsGet.obs,
        nameGeneratorText: "Learn Hieroglyphics".obs,
      ),
    ]);
  }
}
