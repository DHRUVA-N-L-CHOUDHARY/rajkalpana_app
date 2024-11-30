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
                            // Name Field
                            _buildTextField(
                              label: "Name",
                              initialValue: controller.name,
                              onChanged: (value) =>
                                  controller.updateName(value),
                              context: context,
                            ),
                            SizedBox(height: 16.h),

                            _buildDateOfBirthField(controller, context),

                            SizedBox(height: 16.h),

                            _buildTextField(
                              label: "Emergency Phone",
                              initialValue: controller.emergencyPhone,
                              onChanged: (value) =>
                                  controller.updateEmergencyPhone(value),
                              keyboardType: TextInputType.phone,
                              context: context,
                            ),
                            SizedBox(height: 16.h),

                            // Pin Code Field
                            _buildTextField(
                              label: "Pin Code",
                              initialValue: controller.pinCode,
                              onChanged: (value) =>
                                  controller.updatePinCode(value),
                              keyboardType: TextInputType.number,
                              context: context,
                            ),
                            SizedBox(height: 16.h),

                            _buildDropdowns(controller, context),

                            // Address Field
                            _buildTextField(
                              label: "Address",
                              initialValue: controller.address,
                              onChanged: (value) =>
                                  controller.updateAddress(value),
                              context: context,
                            ),
                            SizedBox(height: 16.h),

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
              Get.back();
            },
          ),
          Expanded(
            child: Text(
              "Edit Profile",
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

  Widget _buildDateOfBirthField(
      EditProfileController controller, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Date of Birth",
          style: TextStyle(
            color:
                Theme.of(context).textTheme.bodyMedium?.color ?? Colors.black,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          readOnly: true, // Make the field non-editable
          controller:
              TextEditingController(text: controller.dob), // Display DOB value
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black,
          ),
          decoration: InputDecoration(
              suffixIcon: GestureDetector(
                onTap: () async {
                  _selectDate(context, controller); // Open Date Picker
                },
                child: Icon(
                  Icons.calendar_today,
                  size: 20.sp,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              filled: true,
              fillColor: Theme.of(context).colorScheme.surface,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.r),
                borderSide: BorderSide(
                  color: Theme.of(context).dividerColor,
                  width: 1.0,
                ),
              )),
          onTap: () async {
            _selectDate(context, controller); 
          },
        ),
      ],
    );
  }

  Future<void> _selectDate(
      BuildContext context, EditProfileController controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.parse(controller.dob), // Default date
      firstDate: DateTime(1900), // Start date
      lastDate: DateTime.now(), // End date
    );

    if (pickedDate != null) {
      String formattedDate =
          "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
      controller.updateDob(formattedDate); // Update DOB in controller
    }
  }

  // Profile Picture Widget
  Widget _buildProfilePicture(
      BuildContext context, EditProfileController controller) {
    return GestureDetector(
      onTap: () {
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
                  await controller.pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () async {
                  Navigator.of(context).pop();
                  await controller.pickImage(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Editable Text Field
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
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          initialValue: initialValue,
          onChanged: onChanged,
          keyboardType: keyboardType,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).colorScheme.surface,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: BorderSide(
                color: Theme.of(context).dividerColor,
                width: 1.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Read-Only Field
  Widget _buildReadOnlyField({
    required String label,
    required String value,
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
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(4.r),
            border: Border.all(
              color: Theme.of(context).dividerColor,
              width: 1.0,
            ),
          ),
          child: Text(
            value,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color:
                  Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black,
            ),
          ),
        ),
      ],
    );
  }

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
          mainAxisAlignment: MainAxisAlignment.start,
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
            SizedBox(width: 40.w),
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

  Widget _buildDropdowns(
      EditProfileController controller, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Nationality Dropdown
        Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: _buildDropdown(
            label: "Nationality",
            value: controller.nationality,
            items: ["India", "USA", "UK", "Australia", "Canada"],
            onChanged: (value) {
              controller.updateNationality(value ?? "India");
            },
            context: context,
          ),
        ),

        // State and City in Row
        Row(
          children: [
            // State Dropdown
            Expanded(
              child: _buildDropdown(
                label: "State",
                value: controller.state,
                items: [
                  "Tamil Nadu",
                  "Karnataka",
                  "Kerala",
                  "Maharashtra",
                  "Delhi"
                ],
                onChanged: (value) {
                  controller.updateState(value ?? "");
                },
                context: context,
              ),
            ),
            SizedBox(width: 16.w), // Space between State and City

            // City Dropdown
            Expanded(
              child: _buildDropdown(
                label: "City",
                value: controller.city,
                items: ["Chennai", "Bangalore", "Mumbai", "Delhi", "Hyderabad"],
                onChanged: (value) {
                  controller.updateCity(value ?? "");
                },
                context: context,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required String label,
    required String value,
    required List<String> items,
    required Function(String?) onChanged,
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
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8.h),
        DropdownButtonFormField<String>(
          value: value,
          onChanged: onChanged,
          items: items
              .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Theme.of(context).textTheme.bodyLarge?.color ??
                            Colors.black,
                      ),
                    ),
                  ))
              .toList(),
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).colorScheme.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: BorderSide(
                color: Theme.of(context).dividerColor,
                width: 1.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
