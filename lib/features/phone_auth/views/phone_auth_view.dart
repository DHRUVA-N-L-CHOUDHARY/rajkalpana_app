import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travel_bus_app/features/phone_auth/controllers/phone_auth_controller.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/utils/constants.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_text_field.dart';

class PhoneAuthView extends StatelessWidget {
  const PhoneAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PhoneAuthController>(
      init: PhoneAuthController(),
      builder: (c) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: ListView(
            children: [
              SizedBox(height: 40.h),
              // Updated Logo with Padding
              Center(
                child: Image.asset(
                  appConst + AppImages.kAppIconNamed,
                  width: Get.width * 0.35,
                  height: 100.h,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 40.h),
              // Welcome Text
              Center(
                child: Text(
                  "Welcome to Raj Kalpana",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              SizedBox(height: 20.h),
              // Subheading
              Center(
                child: Text(
                  "Login using your mobile number to sign in",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.grey[700],
                        height: 1.5,
                      ),
                ),
              ),
              SizedBox(height: 30.h),
              // Mobile Number Label
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.h),
                child: Text(
                  "Your mobile number",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              // Input Field with Country Code
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Expanded(
                  child: AppTextField(
                    controller: c.phonController,
                    keyBoardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10),
                    ],
                    hintText: "Enter your phone number",
                    prefixText: "+91",
                    borderColor: Theme.of(context).colorScheme.primary,
                    borderWidth: 1.5,
                    focusNode: c.phoneFocusNode,
                  ),
                ),
              ),
            ],
          ),
          // Updated Bottom Navigation Bar
          bottomNavigationBar: Padding(
            padding: EdgeInsets.all(16.0).w,
            child: SizedBox(
              height: Get.height * 0.20,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppButton(
                    text: "Get OTP",
                    onPressed: () {
                      Get.toNamed(AppPages.VERIFY_OTP);
                    },
                    isLoading: false, // Set to true when loading
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    textColor: Colors.white,
                    borderRadius: 12.r,
                    width: double.infinity,
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      "By pressing this, you agree to our Privacy Policy and Terms and Conditions",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.grey[600],
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
