import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CitiesSearchController extends GetxController {
  // TODO: Add controller properties and methods here

  final TextEditingController searchController = new TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  final Map<String, dynamic> arguments = Get.arguments;
  String type = "";

  final List<String> allCities = [
    "Chennai CMBT @ 5:50am",
    "Chennai CMBT @ 6:40am",
    "Chennai CMBT @ 7:38am",
    "Chennai CMBT @ 9:18am",
    "Bangalore BS @ 5:50am",
    "Bangalore BS @ 6:40am",
    "Hyderabad Central @ 7:38am",
    "Mumbai CST @ 9:20am",
    // Additional cities can be added here
  ];

  // List of filtered cities based on search input
  List<String> filteredCities = [];

  Timer? _debounce; // Timer for debounce effect

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      searchFocusNode.requestFocus();
    });
    type = arguments["type"];
    filteredCities = allCities; // Display all cities initially
  }

  @override
  void dispose() {
    // Dispose of the FocusNode when no longer needed to avoid memory leaks
    searchFocusNode.dispose();
    searchController.dispose();
    super.dispose();
  }

  // Method to handle search input with debounce
  void onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(Duration(milliseconds: 300), () {
      if (query.isEmpty) {
        filteredCities = allCities;
      } else {
        filteredCities = allCities
            .where((city) => city.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
      update(); // Update the UI with the filtered list
    });
  }

  void selectCity(String city) {
    Get.back(result: city);
  }

  @override
  void onClose() {
    _debounce?.cancel();
    searchController.dispose();
    searchFocusNode.dispose();
    super.onClose();
  }
}
