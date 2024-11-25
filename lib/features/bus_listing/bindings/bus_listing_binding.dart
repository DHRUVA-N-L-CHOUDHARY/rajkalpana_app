import 'package:get/get.dart';
import '../controllers/bus_listing_controller.dart';

class BusListingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BusListingController>(() => BusListingController());
  }
}
