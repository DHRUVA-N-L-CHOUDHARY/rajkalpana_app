import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:raj_kalpana_travels/shared/utils/constants.dart';

import '../../../data/services/local_storage_service.dart';

class EditProfileController extends GetxController {
  // Controller properties for each field
  String name = "Kayal";
  String profileImage = appConst + AppImages.kAppIconNamed;
  String emergencyPhone = "+91 98765 43210";
  String nationality = "India"; // Default set to India
  String state = "Tamil Nadu";
  String city = "Chennai";
  String address = "123, Street Name, Area, Chennai - 600001";
  String dob = "2002-01-01"; // Default in YYYY-MM-DD format
  String gender = "Female";
  String pinCode = "600001"; // Pin code for fetching state and city

  void updateName(String newName) {
    name = newName;
    update();
  }

  void updateEmergencyPhone(String newEmergencyPhone) {
    emergencyPhone = newEmergencyPhone;
    update();
  }

  void updatePinCode(String newPinCode) {
    pinCode = newPinCode;
    fetchLocationDetailsFromPinCode(newPinCode);
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
    update(); 

    final user = await LocalStorageService.getUser();
    if (user != null) {
    }
  }

  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      await updateProfilePicture(pickedFile.path);
    }
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
  void fetchLocationDetailsFromPinCode(String pinCode) {
    if (pinCode == "600001") {
      state = "Tamil Nadu";
      city = "Chennai";
    } else {
      state = "Unknown State";
      city = "Unknown City";
    }
  }

  void saveProfile() {
    Get.snackbar(
      "Profile Updated",
      "Your profile details have been updated successfully!",
    );
  }
}
