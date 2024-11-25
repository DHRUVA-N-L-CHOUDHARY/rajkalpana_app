import 'package:get/get.dart';
import '../controllers/offer_listing_controller.dart';

class OfferListingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OfferListingController>(() => OfferListingController());
  }
}
