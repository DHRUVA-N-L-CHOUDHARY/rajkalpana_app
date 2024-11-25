import 'package:get/get.dart';
import '../controllers/wallet_listing_controller.dart';

class WalletListingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WalletListingController>(() => WalletListingController());
  }
}
