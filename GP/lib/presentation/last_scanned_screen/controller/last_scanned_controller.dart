// controller/last_scanned_controller.dart
import 'package:get/get.dart';
import 'package:hierosecret/presentation/last_scanned_screen/models/cardcomponent_item_model.dart';
import 'package:hierosecret/presentation/last_scanned_screen/controller/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LastScannedController extends GetxController {
  RxList<CardcomponentItemModel> scannedList = <CardcomponentItemModel>[].obs;
  final FirestoreService _firestoreService = FirestoreService();

  @override
  void onInit() {
    super.onInit();
    fetchScans();
  }

  Future<void> fetchScans() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        List<CardcomponentItemModel> scans = await _firestoreService.getScans(user.uid);
        scannedList.clear();
        scannedList.addAll(scans);
      }
    } catch (e) {
      print('Error fetching scans: $e');
    }
  }
}
