import 'package:hierosecret/core/app_export.dart';
import 'package:hierosecret/presentation/name_generator_screen_result_screen/models/name_generator_screen_result_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the NameGeneratorScreenResultScreen.
///
/// This class manages the state of the NameGeneratorScreenResultScreen, including the
/// current nameGeneratorScreenResultModelObj
class NameGeneratorScreenResultController extends GetxController {
  TextEditingController nameGeneratorvalueController = TextEditingController();

  Rx<NameGeneratorScreenResultModel> nameGeneratorScreenResultModelObj =
      NameGeneratorScreenResultModel().obs;

  @override
  void onClose() {
    super.onClose();
    nameGeneratorvalueController.dispose();
  }
}
