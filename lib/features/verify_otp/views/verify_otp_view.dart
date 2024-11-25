import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:otp_pin_field/otp_pin_field.dart';
import 'package:travel_bus_app/shared/utils/constants.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/widgets/app_button.dart';

class VerifyOtpView extends StatelessWidget {
  const VerifyOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView(
        children: [
          SizedBox(height: 40.h),
          Center(
            child: Image.asset(
              appConst + AppImages.kAppIconNamed,
              width: Get.width * 0.35,
            ),
          ),
          SizedBox(height: 40.h),
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
          SizedBox(height: 10.h),
          Center(
            child: Text(
              "Enter the verification code sent to",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.grey[700],
                  ),
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "+91 xxxxx-xxxxx", // Replace with phone number dynamically
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              SizedBox(width: 4.w),
              Icon(
                Icons.edit,
                size: 18.sp,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0.w, vertical: 10.h),
            child: Text(
              "One Time Password (OTP)",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          _buildOTPPinField(context),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0.w, vertical: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    // Add resend logic here
                  },
                  child: Text(
                    "Resend in 10 secs",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: AppButton(
          text: "Login / Get Started",
          onPressed: () {
            Get.toNamed(AppPages.REGISTER_USER);
          },
          backgroundColor: Theme.of(context).colorScheme.primary,
          textColor: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }

  Widget _buildOTPPinField(BuildContext context) {
    return OtpPinField(
      autoFillEnable: true,
      textInputAction: TextInputAction.done,
      onSubmit: (text) {
        print('Entered pin is $text');
      },
      onChange: (text) {
        print('Enter on change pin is $text');
      },
      onCodeChanged: (code) {
        print('onCodeChanged is $code');
      },
      otpPinFieldStyle: OtpPinFieldStyle(
        defaultFieldBorderColor: Theme.of(context).dividerColor,
        activeFieldBorderColor: Theme.of(context).colorScheme.primary,
        fieldBorderWidth: 1,
      ),
      maxLength: 4,
      fieldHeight: 50.h,
      fieldWidth: 60.w,
      showCursor: true,
      cursorColor: Theme.of(context).colorScheme.primary,
      cursorWidth: 2,
      mainAxisAlignment: MainAxisAlignment.center,
      otpPinFieldDecoration: OtpPinFieldDecoration.defaultPinBoxDecoration,
    );
  }
}
