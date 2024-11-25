import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileController>(
      init: EditProfileController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: Stack(
            children: [
              Container(
                height: Get.height / 4,
                color: Theme.of(context).colorScheme.primary,
              ),
              Column(
                children: [
                  _buildHeader(context),
                  _buildProfilePicture(context, controller),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 16.h),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            // SizedBox(height: 24.h),
                            _buildTextField(
                              label: "First Name",
                              initialValue: controller.firstName,
                              onChanged: (value) {
                                controller.updateFirstName(value);
                              },
                              context: context,
                            ),
                            SizedBox(height: 16.h),
                            _buildTextField(
                              label: "Last Name",
                              initialValue: controller.lastName,
                              onChanged: (value) {
                                controller.updateLastName(value);
                              },
                              context: context,
                            ),
                            SizedBox(height: 16.h),
                            _buildTextField(
                              label: "Mobile Number",
                              initialValue: controller.mobileNumber,
                              onChanged: (value) {
                                controller.updateMobileNumber(value);
                              },
                              keyboardType: TextInputType.phone,
                              context: context,
                            ),
                            SizedBox(height: 16.h),
                            _buildTextField(
                              label: "Emergency Phone",
                              initialValue: controller.emergencyPhone,
                              onChanged: (value) {
                                controller.updateEmergencyPhone(value);
                              },
                              keyboardType: TextInputType.phone,
                              context: context,
                            ),
                            SizedBox(height: 16.h),
                            _buildTextField(
                              label: "E-Mail",
                              initialValue: controller.email,
                              onChanged: (value) {
                                controller.updateEmail(value);
                              },
                              keyboardType: TextInputType.emailAddress,
                              context: context,
                            ),
                            SizedBox(height: 16.h),
                            _buildTextField(
                              label: "Nationality",
                              initialValue: controller.nationality,
                              onChanged: (value) {
                                controller.updateNationality(value);
                              },
                              context: context,
                            ),
                            SizedBox(height: 16.h),
                            _buildTextField(
                              label: "State",
                              initialValue: controller.state,
                              onChanged: (value) {
                                controller.updateState(value);
                              },
                              context: context,
                            ),
                            SizedBox(height: 16.h),
                            _buildTextField(
                              label: "City",
                              initialValue: controller.city,
                              onChanged: (value) {
                                controller.updateCity(value);
                              },
                              context: context,
                            ),
                            SizedBox(height: 16.h),
                            _buildTextField(
                              label: "Address",
                              initialValue: controller.address,
                              onChanged: (value) {
                                controller.updateAddress(value);
                              },
                              context: context,
                            ),
                            SizedBox(height: 16.h),
                            _buildTextField(
                              label: "Date of Birth",
                              initialValue: controller.dob,
                              onChanged: (value) {
                                controller.updateDob(value);
                              },
                              keyboardType: TextInputType.datetime,
                              context: context,
                            ),
                            SizedBox(height: 16.h),
                            _buildGenderSelection(controller, context),
                            SizedBox(height: 40.h),
                            _buildUpdateButton(controller, context),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  // Header Widget
  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back,
                color: Theme.of(context).colorScheme.onPrimary),
            onPressed: () {
              // Back button action
              Get.back();
            },
          ),
          Expanded(
            child: Text(
              "Profile",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Profile Picture Widget
  Widget _buildProfilePicture(BuildContext context, EditProfileController controller) {
    return GestureDetector(
      onTap: () {
        // Add functionality to change the profile picture
        _showImageSourceSelector(context, controller);
      },
      child: CircleAvatar(
        radius: 50.r,
        backgroundImage: AssetImage(controller.profileImage),
        child: Align(
          alignment: Alignment.bottomRight,
          child: CircleAvatar(
            radius: 15.r,
            backgroundColor: Theme.of(context).colorScheme.surface,
            child: Icon(
              Icons.camera_alt,
              size: 15.r,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }

  void _showImageSourceSelector(
      BuildContext context, EditProfileController controller) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () async {
                  Navigator.of(context).pop();
                  await controller.pickImage(ImageSource.gallery, controller);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () async {
                  Navigator.of(context).pop();
                  await controller.pickImage(ImageSource.camera, controller);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Text Field Widget
  Widget _buildTextField({
    required String label,
    required String initialValue,
    required Function(String) onChanged,
    TextInputType keyboardType = TextInputType.text,
    required BuildContext context,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color:
                Theme.of(context).textTheme.bodyMedium?.color ?? Colors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500, // Slightly bold as in the screenshot
          ),
        ),
        SizedBox(height: 8.h), // Proper spacing between label and field
        TextFormField(
          initialValue: initialValue,
          onChanged: onChanged,
          keyboardType: keyboardType,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400, // Normal text weight
            color: Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context)
                .colorScheme
                .surface, // Matches the white background
            contentPadding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 10.h), // Matches padding in the screenshot
            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(4.r), // Slightly rounded corners
              borderSide: BorderSide(
                color:
                    Theme.of(context).dividerColor, // Default thin border color
                width: 1.0, // Thin border width
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: BorderSide(
                color: Theme.of(context)
                    .dividerColor, // Visible even when not selected
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: BorderSide(
                color: Theme.of(context)
                    .colorScheme
                    .primary, // Primary color on focus
                width: 1.5, // Slightly thicker border on focus
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Gender Selection Widget
  Widget _buildGenderSelection(
      EditProfileController controller, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Gender",
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyMedium!.color,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start, // Aligns to the left
          children: [
            GestureDetector(
              onTap: () => controller.updateGender("Male"),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30.r,
                    backgroundColor: controller.gender == "Male"
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).dividerColor,
                    child: Icon(Icons.male,
                        color: controller.gender == "Male"
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.primary,
                        size: 30.sp),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Male",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: controller.gender == "Male"
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: controller.gender == "Male"
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).textTheme.bodyLarge!.color,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 40.w), // Space between Male and Female options
            GestureDetector(
              onTap: () => controller.updateGender("Female"),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30.r,
                    backgroundColor: controller.gender == "Female"
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).dividerColor,
                    child: Icon(Icons.female,
                        color: controller.gender == "Female"
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.primary,
                        size: 30.sp),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Female",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: controller.gender == "Female"
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: controller.gender == "Female"
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).textTheme.bodyLarge!.color,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Update Button Widget
  Widget _buildUpdateButton(
      EditProfileController controller, BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 14.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      onPressed: () {
        controller.saveProfile();
      },
      child: Text(
        "Update",
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}
