import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_bus_app/shared/utils/constants.dart';
import '../controllers/about_us_controller.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AboutUsController>(
      init: AboutUsController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            elevation: 0,
            iconTheme: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
            title: Text(
              'About Us',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        appConst + AppImages.kAppIconNamed, // Replace with actual logo path
                        width: Get.width * 0.4,
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(height: 20.h),
                      Text(
                        'Lorem ipsum dolor sit amet consectetur. Velit vel rhoncus sit vestibulum est enim et. Leo amet et commodo quam. Enim convallis viverra rhoncus arcu. Netus sit natoque dignissim mauris eu id tellus. In turpis scelerisque gravida mi. Lacinia sapien sit morbi varius ornare. Interdum velit natoque lectus lacus nullam at. Consectetur porttitor porttitor sagittis quis tempor pellentesque.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                Text(
                  'Official Documents',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                  ),
                ),
                SizedBox(height: 20.h),
                _buildDocumentOption(Icons.description, 'Terms and Conditions', context),
                SizedBox(height: 10.h),
                _buildDocumentOption(Icons.lock, 'Privacy Policy', context),
                SizedBox(height: 10.h),
                _buildDocumentOption(Icons.language, 'Official Website', context),
                SizedBox(height: 10.h),
                _buildDocumentOption(Icons.receipt, 'Licenses', context),
                SizedBox(height: 10.h),
                _buildDocumentOption(Icons.assignment, 'User Agreement', context),
                const Spacer(),
                Center(
                  child: Text(
                    '📡 version v4.3',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Theme.of(context).textTheme.bodyMedium!.color,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDocumentOption(IconData icon, String title, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.primary),
          SizedBox(width: 16.w),
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
          ),
        ],
      ),
    );
  }
}
