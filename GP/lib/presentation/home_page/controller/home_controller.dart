import 'package:hierosecret/core/app_export.dart';
import 'package:hierosecret/presentation/home_page/models/home_model.dart';
import 'package:hierosecret/widgets/custom_bottom_app_bar.dart';

/// A controller class for the HomePage.
///
/// This class manages the state of the HomePage, including the
/// current homeModelObj
class HomeController extends GetxController {
  HomeController();
  HomeController.withModel(this.homeModelObj);

  Rx<HomeModel> homeModelObj = HomeModel().obs;

  Rx<int> sliderIndex = 0.obs;

  CustomBottomAppBar get bottomAppBar => Get.find<CustomBottomAppBar>();
}
