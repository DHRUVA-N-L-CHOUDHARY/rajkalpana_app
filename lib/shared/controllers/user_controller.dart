import 'package:get/get.dart';
import '../../data/models/user_model.dart';
import '../../data/repositories/user_repository.dart';
import '../../routes/app_pages.dart';

class UserController extends GetxController {
  final UserRepository _userRepository = UserRepository();

  Rxn<UserModel> user = Rxn<UserModel>();
  RxBool isLoggedIn = true.obs;

  // Load user state on app start
  Future<void> loadUserState() async {
    final localUser = _userRepository.getUser();
    if (localUser != null) {
      user.value = localUser;
      isLoggedIn.value = true;
    }
  }

  // Handle login
  Future<void> login(String email, String password) async {
    final loggedInUser = await _userRepository.login(email, password);
    if (loggedInUser != null) {
      user.value = loggedInUser;
      isLoggedIn.value = true;
      Get.offNamed(AppPages.HOME); // Navigate to Home
    } else {
      Get.snackbar('Login Failed', 'Invalid email or password');
    }
  }

  // Load user data on app opening
  Future<void> loadUserData() async {
    final fetchedUser = await _userRepository.fetchUser();
    if (fetchedUser != null) {
      user.value = fetchedUser;
      isLoggedIn.value = true;
    } else {
      isLoggedIn.value = true;
    }
  }

  // Logout logic
  Future<void> logout() async {
    user.value = null;
    isLoggedIn.value = false;
    await _userRepository.clearUser();
  }
}
