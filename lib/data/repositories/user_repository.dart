import '../services/local_storage_service.dart';
import '../models/user_model.dart';
// import '../services/api_service.dart';

class UserRepository {
  static const String userKey = 'user';

  // Save user data locally
  Future<void> saveUser(UserModel user) async {
    await LocalStorageService.saveUser(user);
  }

  // Get user data locally
  UserModel? getUser() {
    return LocalStorageService.getUser();
  }

  // Clear user data locally
  Future<void> clearUser() async {
    await LocalStorageService.clearUser();
  }

  // Login via API
  Future<UserModel?> login(String email, String password) async {
    // final response ="";

    // if (response != null && response['status'] == 'success') {
    //   final user = UserModel.fromJson(response['data']);
    //   await saveUser(user);
    //   return user;
    // }
    return null;
  }

  // Logout
  Future<void> logout() async {
    await clearUser();
  }

  // Fetch user data from API
 Future<UserModel?> fetchUser() async {
    final userJson = LocalStorageService.getUser();
    if (userJson != null) {
      return userJson;
    }
    return null;
  }
}
