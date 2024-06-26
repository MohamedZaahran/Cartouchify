import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hierosecret/presentation/last_scanned_screen/models/cardcomponent_item_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<CardcomponentItemModel>> getScans(String userId) async {
    QuerySnapshot snapshot = await _firestore.collection('users').doc(userId).collection('scans').orderBy("timestamp").get();

    List<CardcomponentItemModel> scansList = snapshot.docs.map((doc) {
      Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;

      return CardcomponentItemModel(
        imageURL: data?['image_url'] ?? '',
        description: data?['description'] ?? '',
        timeStamp: (data?['timestamp'] as Timestamp?)?.toDate().toString() ?? DateTime.now().toString(),
      );
    }).toList();

    return scansList;
  }
}
