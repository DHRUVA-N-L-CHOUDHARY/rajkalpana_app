import 'package:get/get.dart';
import '../controllers/board_drop_points_listing_controller.dart';

class BoardDropPointsListingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BoardDropPointsListingController>(() => BoardDropPointsListingController());
  }
}
