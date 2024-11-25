import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../theme/app_theme.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs;

  // Load theme from local storage
  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    isDarkMode.value = prefs.getBool('isDarkMode') ?? false;
    Get.changeTheme(isDarkMode.value ? AppTheme.darkTheme : AppTheme.lightTheme);
  }

  // Toggle theme and save locally
  Future<void> toggleTheme() async {
    isDarkMode.value = !isDarkMode.value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDarkMode.value);
    Get.changeTheme(isDarkMode.value ? AppTheme.darkTheme : AppTheme.lightTheme);
  }
}
