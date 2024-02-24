import 'package:get/get.dart';
import 'package:hierosecret/presentation/explore_places_screen/models/cardslist_item_model.dart';
import 'firestore_service.dart';

// explore_places_controller.dart

class ExplorePlacesController extends GetxController {
  RxList<CardslistItemModel> explorePlacesList = <CardslistItemModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPlaces();
  }

  Future<void> fetchPlaces() async {
    try {
      print('Fetching places...');
      List<CardslistItemModel> places = await FirestoreService().getPlaces();

      // Clear the existing list before updating
      explorePlacesList.clear();

      // AddAll places to the list
      explorePlacesList.addAll(places);

      print('Places fetched successfully: $places');
    } catch (e) {
      print('Error fetching places: $e');
      // Handle the error appropriately (e.g., show a message to the user)
    }
  }
}
