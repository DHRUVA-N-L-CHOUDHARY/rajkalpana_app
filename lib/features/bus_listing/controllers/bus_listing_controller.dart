import 'package:get/get.dart';

class BusListingController extends GetxController {
  int selectedIndex = 2;
  List<DateTime> dateList = [];

  @override
  void onInit() {
    super.onInit();
    initializeDates();
  }

  void initializeDates() {
    DateTime today = DateTime.now();
    today = DateTime(today.year, today.month, today.day);
    dateList = List.generate(
      5,
      (index) => today.add(Duration(days: index - 2)),
    ).where((date) => !date.isBefore(today)).toList();
    selectedIndex = 0;
    update();
  }

  void updateSelectedIndex(int index) {
    selectedIndex = index;
    updateDatesAroundSelected();
    update();
  }

  void updateDatesAroundSelected() {
    DateTime selectedDate = dateList[selectedIndex];
    DateTime today = DateTime.now();
    today = DateTime(today.year, today.month, today.day);

    dateList = List.generate(
      5,
      (index) => selectedDate.add(Duration(days: index - 2)),
    ).where((date) => !date.isBefore(today)).toList();

    selectedIndex =
        dateList.contains(selectedDate) ? dateList.indexOf(selectedDate) : 0;
    update();
  }
}
