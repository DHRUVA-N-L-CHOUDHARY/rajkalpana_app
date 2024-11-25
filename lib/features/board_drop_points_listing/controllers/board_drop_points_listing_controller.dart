import 'package:get/get.dart';

class BoardDropPointsListingController extends GetxController {
  List<String> boardingPoints = [
    "Chennai CMBT @ 5:50am",
    "Chennai CMBT @ 6:40am",
    "Chennai CMBT @ 7:38am",
    "Chennai CMBT @ 9:18am",
    "Chennai CMBT @ 9:20am"
  ];

  List<String> deboardingPoints = [
    "Chennai CMBT @ 5:50am",
    "Chennai CMBT @ 6:40am",
    "Chennai CMBT @ 7:38am",
    "Chennai CMBT @ 9:18am",
    "Chennai CMBT @ 9:20am"
  ];

  String selectedBoardingPoint = "Chennai CMBT @ 5:50am";
  String selectedDeboardingPoint = "Chennai CMBT @ 5:50am";
}
