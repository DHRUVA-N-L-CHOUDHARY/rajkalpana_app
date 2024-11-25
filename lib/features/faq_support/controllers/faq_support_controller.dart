import 'package:get/get.dart';

class FaqSupportController extends GetxController {
  final Map<String, bool> _faqExpandedState = {
    'How do I change my password?': false,
    'How to change payment methods': false,
  };

  // Holds the search text
  var searchText = ''.obs;

  void onSearchChanged(String value) {
    searchText.value = value;
    update();
  }

  void toggleFaq(String question) {
    _faqExpandedState[question] = !_faqExpandedState[question]!;
    update();
  }

  bool isFaqExpanded(String question) {
    return _faqExpandedState[question] ?? false;
  }
}
