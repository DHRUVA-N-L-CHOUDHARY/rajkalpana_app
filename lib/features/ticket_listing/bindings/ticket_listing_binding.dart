import 'package:get/get.dart';
import '../controllers/ticket_listing_controller.dart';

class TicketListingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TicketListingController>(() => TicketListingController());
  }
}
