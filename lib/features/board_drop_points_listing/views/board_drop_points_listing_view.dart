import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/board_drop_points_listing_controller.dart';

class BoardDropPointsListingView extends StatelessWidget {
  const BoardDropPointsListingView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BoardDropPointsListingController>(
        init: BoardDropPointsListingController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back,
                    color: Theme.of(context).colorScheme.onPrimary),
                onPressed: () => Get.back(),
              ),
              title: Text(
                "Points",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 18.sp,
                ),
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  // Boarding Points
                  Text(
                    "Boarding points:",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).textTheme.bodyLarge!.color,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  _buildRadioGroup(
                    controller.boardingPoints,
                    controller.selectedBoardingPoint,
                    (value) {
                      controller.selectedBoardingPoint = value!;
                      controller.update();
                    },
                    context,
                  ),
                  SizedBox(height: 20.h),
                  // Deboarding Points
                  Text(
                    "Deboarding points:",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).textTheme.bodyLarge!.color,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  _buildRadioGroup(
                    controller.deboardingPoints,
                    controller.selectedDeboardingPoint,
                    (value) {
                      controller.selectedDeboardingPoint = value!;
                      controller.update();
                    },
                    context,
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: Text(
                    "Proceed",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget _buildRadioGroup(
    List<String> options,
    String selectedValue,
    Function(String?) onChanged,
    BuildContext context,
  ) {
    return Column(
      children: options.map((option) {
        return RadioListTile<String>(
          value: option,
          groupValue: selectedValue,
          onChanged: onChanged,
          contentPadding: EdgeInsets.zero,
          visualDensity: VisualDensity(horizontal: -4, vertical: -4),
          title: Text(
            option,
            style: TextStyle(
              fontSize: 12.sp,
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
          ),
          activeColor: Theme.of(context).colorScheme.primary,
        );
      }).toList(),
    );
  }
}
