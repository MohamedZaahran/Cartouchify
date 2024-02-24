// firestore_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hierosecret/presentation/explore_places_screen/models/cardslist_item_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<CardslistItemModel>> getPlaces() async {
    QuerySnapshot snapshot = await _firestore.collection('Places').get();

    // Convert each document to a CardslistItemModel
    List<CardslistItemModel> placesList = snapshot.docs.map((doc) {
      // Explicitly cast the result of doc.data() to Map<String, dynamic>
      Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;

      // Use null-aware operators to handle potential null values
      return CardslistItemModel(
        name:
            data?['name'] ?? '', // Default to an empty string if 'name' is null
        about: data?['about'] ?? '',
        About: data?['About'] ?? '',
        Imageurl: data?['Imageurl'] ?? '',
        longitude: data?['longitude'] ?? '',
        latitude: data?['latitude'] ?? '',
        rating: data?['rating'] ?? '',

        // Default to an empty string if 'about' is null
      );
    }).toList();

    return placesList;
  }
}
