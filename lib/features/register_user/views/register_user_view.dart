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
                    label: "Name",
                    controller: c.nameController,
                    errorText: c.nameError,
                    onChanged: c.validateName,
                    context: context),

                SizedBox(height: 10.h),
                // Email Address
                _buildTextFormField(
                    label: "Email address",
                    controller: c.emailController,
                    errorText: c.emailError,
                    onChanged: c.validateEmail,
                    keyboardType: TextInputType.emailAddress,
                    context: context),

                SizedBox(height: 10.h),
                // Password
                _buildPasswordField(
                    label: "Password",
                    controller: c.passwordController,
                    isVisible: c.isPasswordVisible,
                    errorText: c.passwordError,
                    onChanged: c.validatePassword,
                    context: context),

                SizedBox(height: 10.h),
                // Confirm Password
                _buildPasswordField(
                    label: "Confirm password",
                    controller: c.confirmPasswordController,
                    isVisible: c.isConfirmPasswordVisible,
                    errorText: c.confirmPasswordError,
                    onChanged: c.validateConfirmPassword,
                    context: context),

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
                        context: context),
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
    required BuildContext context, // For theme access
  }) {
    return Obx(() {
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
            controller: controller,
            keyboardType: keyboardType,
            onChanged: onChanged,
            style: TextStyle(
              fontSize: 16.sp,
              color:
                  Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black,
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              labelText: label,
              errorText: errorText.value.isNotEmpty ? errorText.value : null,
              labelStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).textTheme.bodyMedium?.color ??
                    Colors.black,
              ),
              filled: true,
              fillColor: Theme.of(context)
                  .colorScheme
                  .surface, // Same as your other fields
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
              suffixIcon:
                  suffixIcon, // Allows suffix icons such as date picker or others
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 1.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 1.5,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.error,
                  width: 1.0,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.error,
                  width: 1.5,
                ),
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget _buildPasswordField({
    required String label,
    required TextEditingController controller,
    required RxBool isVisible,
    required RxString errorText,
    required Function(String) onChanged,
    required BuildContext context,
  }) {
    return Obx(() {
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
            controller: controller,
            obscureText: !isVisible.value,
            onChanged: onChanged,
            decoration: InputDecoration(
              labelText: label,
              errorText: errorText.value.isNotEmpty ? errorText.value : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 1.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 1.5,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.error,
                  width: 1.0,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.error,
                  width: 1.5,
                ),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                    isVisible.value ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  isVisible.value = !isVisible.value;
                },
              ),
            ),
          ),
        ],
      );
    });
  }
}
