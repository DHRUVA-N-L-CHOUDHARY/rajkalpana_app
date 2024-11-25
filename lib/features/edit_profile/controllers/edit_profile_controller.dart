import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_bus_app/shared/utils/constants.dart';

import '../../../data/services/local_storage_service.dart';

class EditProfileController extends GetxController {
  // Controller properties for each field
  String firstName = "Kayal";
  String profileImage = appConst + AppImages.kAppIconNamed;
  String lastName = "Vizhi";
  String mobileNumber = "+91 88475 48524";
  String emergencyPhone = "+91 98765 43210";
  String email = "eddykim@krmail.com";
  String nationality = "Indian";
  String state = "Tamil Nadu";
  String city = "Chennai";
  String address = "123, Street Name, Area, Chennai - 600001";
  String dob = "2002-01-01"; // Default in YYYY-MM-DD format
  String gender = "Female";

  // Update methods for each field
  void updateFirstName(String newFirstName) {
    firstName = newFirstName;
    update();
  }

  void updateLastName(String newLastName) {
    lastName = newLastName;
    update();
  }

  void updateMobileNumber(String newMobileNumber) {
    mobileNumber = newMobileNumber;
    update();
  }

  void updateEmergencyPhone(String newEmergencyPhone) {
    emergencyPhone = newEmergencyPhone;
    update();
  }

  void updateEmail(String newEmail) {
    email = newEmail;
    update();
  }

  void updateNationality(String newNationality) {
    nationality = newNationality;
    update();
  }

  void updateState(String newState) {
    state = newState;
    update();
  }

  void updateCity(String newCity) {
    city = newCity;
    update();
  }

  void updateAddress(String newAddress) {
    address = newAddress;
    update();
  }

  void updateDob(String newDob) {
    dob = newDob;
    update();
  }

  void updateGender(String newGender) {
    gender = newGender;
    update();
  }

  Future<void> updateProfilePicture(String imagePath) async {
    profileImage = imagePath;
    update(); // Notify the UI to update

    // Save image path in local storage
    final user = await LocalStorageService.getUser();
    if (user != null) {
      // user.profileImage = imagePath;
      // await UserRepository.updateUser(user);
    }
  }

  Future<void> pickImage(
      ImageSource source, EditProfileController controller) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      await controller.updateProfilePicture(pickedFile.path);
    }
  }

  // Method to save the updated profile details
  void saveProfile() {
    // Logic to save the updated details can be added here
    // For example, making an API call to update the profile on the server
    Get.snackbar(
      "Profile Updated",
      "Your profile details have been updated successfully!",
    );
  }
}
