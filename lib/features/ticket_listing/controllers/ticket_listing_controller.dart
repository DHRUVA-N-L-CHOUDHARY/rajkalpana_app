import 'package:get/get.dart';

class TicketListingController extends GetxController {


  // Tab state management
  var selectedTabIndex = 0;

  // Tickets for each tab
  final List<Map<String, String>> activeTickets = [
    {
      "from": "Chennai CMBT",
      "fromCode": "CHN",
      "duration": "3:05hrs",
      "to": "Bangalore BS",
      "toCode": "BLR",
      "date": "Today",
      "passenger": "2 Persons",
      "price": "£89/-"
    },
    {
      "from": "Chennai CMBT",
      "fromCode": "CHN",
      "duration": "3:05hrs",
      "to": "Bangalore BS",
      "toCode": "BLR",
      "date": "Tomorrow",
      "passenger": "2 Persons",
      "price": "£89/-"
    },
  ];

  final List<Map<String, String>> completedTickets = [];
  final List<Map<String, String>> cancelledTickets = [];

  // Update selected tab
  void updateSelectedTab(int index) {
    selectedTabIndex = index;
    update(); // Notify UI for update
  }
}
