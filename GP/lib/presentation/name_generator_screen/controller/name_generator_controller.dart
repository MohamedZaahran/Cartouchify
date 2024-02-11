import 'package:hierosecret/core/app_export.dart';
import 'package:hierosecret/presentation/name_generator_screen/models/name_generator_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the NameGeneratorScreen.
///
/// This class manages the state of the NameGeneratorScreen, including the
/// current nameGeneratorModelObj
class NameGeneratorController extends GetxController {
  TextEditingController nameGeneratorvalueController = TextEditingController();

  Rx<NameGeneratorModel> nameGeneratorModelObj = NameGeneratorModel().obs;

  @override
  void onClose() {
    super.onClose();
    nameGeneratorvalueController.dispose();
  }
}
