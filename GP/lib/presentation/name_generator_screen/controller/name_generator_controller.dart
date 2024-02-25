import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hierosecret/core/app_export.dart';

class NameGeneratorController extends GetxController {
  TextEditingController nameGeneratorValueController = TextEditingController();
  RxString mappedSymbols = ''.obs;

  // Define the map within the controller
  final Map<String, String> myMap = {
    'A': '𓄿',
    'B': '𓃀',
    'C': '𓎡',
    'D': '𓂧',
    'E': '𓂝',
    'F': '𓆑',
    'G': '𓎼',
    'H': '𓉔',
    'I': '𓇋',
    'J': '𓆓',
    'K': '𓎡',
    'L': '𓂋',
    'M': '𓅓',
    'N': '𓈖',
    'O': '𓍯',
    'P': '𓊪',
    'Q': '𓈎',
    'R': '𓂋',
    'S': '𓋴',
    'T': '𓏏',
    'U': '𓅱',
    'V': '𓆑',
    'W': '𓅱',
    'X': '𓎡',
    'Y': '𓋴',
    'Z': '𓇌',
  };

  void generateSymbols() {
    final inputText = nameGeneratorValueController.text.toUpperCase();
    String symbols = '';
    for (int i = 0; i < inputText.length; i++) {
      final char = inputText[i];
      final symbol = myMap[char] ?? ''; // Access the symbol from the map
      symbols += symbol;
    }
    mappedSymbols.value = symbols;
  }
}
