import 'package:get/get.dart';

class PassengerListingController extends GetxController {
  // TODO: Add controller properties and methods here

  List<Map<String, dynamic>> passengers = [
    {"name": "Kayal", "age": 19, "gender": "Female"},
    {"name": "Vizhi", "age": 19, "gender": "Female"},
  ];
  int? expandedIndex;

  void toggleExpanded(int index) {
    expandedIndex = expandedIndex == index ? null : index;
    update();
  }

  void addPassenger() {
    passengers.add({"name": "", "age": 0, "gender": ""});
    expandedIndex = passengers.length - 1; // Expand the newly added passenger
    update(); // Update UI
  }

  void updatePassengerName(int index, String name) {
    passengers[index]['name'] = name;
    update();
  }

  void updatePassengerAge(int index, int age) {
    passengers[index]['age'] = age;
    update();
  }

  void updatePassengerGender(int index, String gender) {
    passengers[index]['gender'] = gender;
    update();
  }

  void savePassengerDetails(int index) {
    // Save logic here
    update();
  }
}
