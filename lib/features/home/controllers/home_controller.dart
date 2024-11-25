import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // Reactive variables for state management
  var source = ''.obs; // Source location
  var destination = ''.obs; // Destination location
  var selectedDate = ''.obs; // Selected travel date

  // Observable TextEditingControllers
  var sourceController = TextEditingController().obs;
  var destinationController = TextEditingController().obs;
  var dateController = TextEditingController().obs;

  // Colors (can be moved to theme files)
  final primaryColor = const Color(0xFF06283D); // Dark blue
  final secondaryColor = const Color(0xFF36B37E); // Green

  @override
  void onInit() {
    super.onInit();
    sourceController.value = TextEditingController();
    destinationController.value = TextEditingController();
    dateController.value = TextEditingController();
  }

  @override
  void onClose() {
    sourceController.value.dispose();
    destinationController.value.dispose();
    dateController.value.dispose();
    super.onClose();
  }

  void updateSource(String value) {
    source.value = value;
    sourceController.value.text = value;
    update();
  }

  void updateDestination(String value) {
    destination.value = value;
    destinationController.value.text = value;
    update();
  }

  void updateDate(String value) {
    selectedDate.value = value;
    dateController.value.text = value;
    update();
  }

  void swapFunction() {
    var temp = sourceController.value.text;
    sourceController.value.text = destinationController.value.text;
    source.value = destinationController.value.text;

    destinationController.value.text = temp;
    destination.value = temp;

    update();
  }
}
