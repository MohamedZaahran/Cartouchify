// models/cardcomponent_item_model.dart
import '../../../core/app_export.dart';

class CardcomponentItemModel {
  CardcomponentItemModel({
    String? imageURL,
    String? description,
    String? timeStamp,
  }) {
    this.imageURL = Rx(imageURL ?? '');
    this.description = Rx(description ?? 'Description :');
    this.timeStamp = Rx(timeStamp ?? 'Timestamp :');
  }

  late Rx<String> imageURL;
  late Rx<String> description;
  late Rx<String> timeStamp;
}
