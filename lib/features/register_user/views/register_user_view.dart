import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/utils/constants.dart';
import '../controllers/register_user_controller.dart';

class RegisterUserView extends StatelessWidget {
  const RegisterUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterUserController>(
      init: RegisterUserController(),
      builder: (c) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: Text(
              "Personal Details",
              style: TextStyle(color: Theme.of(context).colorScheme.surface),
            ),
            actions: [
              Center(
                child: Image.asset(
                  appConst + AppImages.kAppIconNamed,
                  width: Get.width * 0.35,
                  height: 100.h,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          body: Form(
            key: c.formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.offAllNamed(AppPages.NAVIGATION);
                      },
                      child: Text(
                        "Skip",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                _buildTextFormField(
                  label: "First name",
                  controller: c.firstNameController,
                  errorText: c.firstNameError,
                  onChanged: c.validateFirstName,
                ),

                SizedBox(height: 10.h),
                // Last Name
                _buildTextFormField(
                  label: "Last name",
                  controller: c.lastNameController,
                  errorText: c.lastNameError,
                  onChanged: c.validateLastName,
                ),

                SizedBox(height: 10.h),
                // Email Address
                _buildTextFormField(
                  label: "Email address",
                  controller: c.emailController,
                  errorText: c.emailError,
                  onChanged: c.validateEmail,
                  keyboardType: TextInputType.emailAddress,
                ),

                SizedBox(height: 10.h),
                // Password
                _buildPasswordField(
                  label: "Password",
                  controller: c.passwordController,
                  isVisible: c.isPasswordVisible,
                  errorText: c.passwordError,
                  onChanged: c.validatePassword,
                ),

                SizedBox(height: 10.h),
                // Confirm Password
                _buildPasswordField(
                  label: "Confirm password",
                  controller: c.confirmPasswordController,
                  isVisible: c.isConfirmPasswordVisible,
                  errorText: c.confirmPasswordError,
                  onChanged: c.validateConfirmPassword,
                ),

                SizedBox(height: 10.h),
                // Date of Birth
                GestureDetector(
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (pickedDate != null) {
                      c.dobController.text =
                          "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                      c.validateDob(c.dobController.text);
                    }
                  },
                  child: AbsorbPointer(
                    child: _buildTextFormField(
                      label: "Date of birth",
                      controller: c.dobController,
                      errorText: c.dobError,
                      onChanged: c.validateDob,
                      keyboardType: TextInputType.datetime,
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                  ),
                ),

                SizedBox(height: 10.h),
                // Gender Selection
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: Text(
                    "Gender",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          c.updateGender("Male");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: c.gender == "Male"
                              ? Theme.of(context).colorScheme.primary
                              : Colors.grey[300],
                          foregroundColor:
                              c.gender == "Male" ? Colors.white : Colors.black,
                        ),
                        child: Text("Male"),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          c.updateGender("Female");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: c.gender == "Female"
                              ? Theme.of(context).colorScheme.primary
                              : Colors.grey[300],
                          foregroundColor: c.gender == "Female"
                              ? Colors.white
                              : Colors.black,
                        ),
                        child: Text("Female"),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                // Submit Button
                ElevatedButton(
                  onPressed: () {
                    if (c.formKey.currentState!.validate()) {
                      c.register();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 16.sp, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextFormField({
    required String label,
    required TextEditingController controller,
    required RxString errorText,
    required Function(String) onChanged,
    TextInputType keyboardType = TextInputType.text,
    Widget? suffixIcon,
  }) {
    return Obx(() {
      return TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: label,
          errorText: errorText.value.isNotEmpty ? errorText.value : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          suffixIcon: suffixIcon,
        ),
      );
    });
  }

  Widget _buildPasswordField({
    required String label,
    required TextEditingController controller,
    required RxBool isVisible,
    required RxString errorText,
    required Function(String) onChanged,
  }) {
    return Obx(() {
      return TextFormField(
        controller: controller,
        obscureText: !isVisible.value,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: label,
          errorText: errorText.value.isNotEmpty ? errorText.value : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          suffixIcon: IconButton(
            icon:
                Icon(isVisible.value ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              isVisible.value = !isVisible.value;
            },
          ),
        ),
      );
    });
  }
}
