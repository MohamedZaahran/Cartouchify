import 'package:get/get.dart';

class CardslistItemModel {
  late Rx<String> name;
  late Rx<String> about;
  late Rx<String> Imageurl;
  late Rx<String> About;
  late Rx<String> longitude;
  late Rx<String> latitude;
  late Rx<String> rating;

  CardslistItemModel(
      {String? name,
      String? about,
      String? Imageurl,
      String? About,
      String? longitude,
      String? latitude,
      String? rating}) {
    this.name = name?.obs ?? Rx<String>("");
    this.about = about?.obs ?? Rx<String>("");
    this.Imageurl = Imageurl?.obs ?? Rx<String>("");
    this.About = About?.obs ?? Rx<String>("");
    this.longitude = longitude?.obs ?? Rx<String>("");
    this.latitude = latitude?.obs ?? Rx<String>("");
    this.rating = rating?.obs ?? Rx<String>("");
  }
}
