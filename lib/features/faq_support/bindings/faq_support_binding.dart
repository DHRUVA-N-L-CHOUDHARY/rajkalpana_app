import 'package:get/get.dart';
import '../controllers/faq_support_controller.dart';

class FaqSupportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FaqSupportController>(() => FaqSupportController());
  }
}
