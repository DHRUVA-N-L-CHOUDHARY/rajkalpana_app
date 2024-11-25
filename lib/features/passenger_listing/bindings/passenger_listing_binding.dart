import 'package:get/get.dart';
import '../controllers/passenger_listing_controller.dart';

class PassengerListingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PassengerListingController>(() => PassengerListingController());
  }
}
