import '../../../core/app_export.dart';
import 'cardcomponent_item_model.dart';

/// This class defines the variables used in the [last_scanned_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class LastScannedModel {
  Rx<List<CardcomponentItemModel>> cardcomponentItemList = Rx([
    CardcomponentItemModel(
        placeName: "Place :".obs,
        date: "Date :".obs,
        museumName: "Grand Egyptian Museum (GEM)".obs,
        museumDate: "20/2/2024".obs),
    CardcomponentItemModel(
        placeName: "Place :".obs,
        date: "Date :".obs,
        museumName: "Grand Egyptian Museum (GEM)".obs,
        museumDate: "20/2/2024".obs),
    CardcomponentItemModel(
        placeName: "Place :".obs,
        date: "Date :".obs,
        museumName: "Grand Egyptian Museum (GEM)".obs,
        museumDate: "20/2/2024".obs),
    CardcomponentItemModel(
        placeName: "Place :".obs,
        date: "Date :".obs,
        museumName: "Grand Egyptian Museum (GEM)".obs,
        museumDate: "20/2/2024".obs),
    CardcomponentItemModel(
        placeName: "Place :".obs,
        date: "Date :".obs,
        museumName: "Grand Egyptian Museum (GEM)".obs,
        museumDate: "20/2/2024".obs)
  ]);
}
