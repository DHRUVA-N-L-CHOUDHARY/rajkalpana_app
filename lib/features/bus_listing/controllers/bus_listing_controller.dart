import 'package:get/get.dart';

class BusListingController extends GetxController {
  // TODO: Add controller properties and methods here
  int selectedIndex = 2; // Start with the selected date in the center
  List<DateTime> dateList = [];

  @override
  void onInit() {
    super.onInit();
    initializeDates();
  }

  void initializeDates() {
    // Set initial date centered around today
    DateTime today = DateTime.now();
    dateList =
        List.generate(5, (index) => today.add(Duration(days: index - 2)));
    update();
  }

  void updateSelectedIndex(int index) {
    selectedIndex = index;
    updateDatesAroundSelected();
    update();
  }

  void updateDatesAroundSelected() {
    DateTime selectedDate = dateList[selectedIndex];
    selectedIndex = 2;
    dateList = List.generate(
        5, (index) => selectedDate.add(Duration(days: index - 2)));
        update();
  }
}
