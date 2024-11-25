import 'package:get/get.dart';
import '../controllers/cities_search_controller.dart';

class CitiesSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CitiesSearchController>(() => CitiesSearchController());
  }
}
