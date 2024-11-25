import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/passenger_details_controller.dart';

class PassengerDetailsView extends StatelessWidget {
  const PassengerDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: const Size(375, 812)); // Responsive scaling

    return GetBuilder<PassengerDetailsController>(
      init: PassengerDetailsController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back,
                  color: Theme.of(context).colorScheme.onPrimary),
              onPressed: () => Get.back(),
            ),
            title: Text(
              "Passenger Details",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 18.sp,
              ),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: ListView(
              children: [
                SizedBox(height: 20.h),
                // Boarding and Deboarding points
                Text(
                  "Boarding and Deboarding points:",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).shadowColor.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.directions_bus,
                                  size: 18.sp,
                                  color: Theme.of(context).colorScheme.primary),
                              SizedBox(width: 8.w),
                              Text(
                                "Chennai CMBT @ 5:50am",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .color),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            children: [
                              Icon(Icons.directions_bus,
                                  size: 18.sp,
                                  color: Theme.of(context).colorScheme.primary),
                              SizedBox(width: 8.w),
                              Text(
                                "Bangalore BS @ 11:15am",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .color),
                              ),
                            ],
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(AppPages.BOARD_DROP_POINTS_LISTING);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.2),
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 6.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        child: Text(
                          "Change",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                // Passenger Details Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Passenger details:",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "+ Add Passenger",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 12.sp),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                _buildTextField("Name", "Eddy Kim", context),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Expanded(child: _buildTextField("Age", "29", context)),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Gender",
                            style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .color,
                                fontSize: 14.sp),
                          ),
                          Row(
                            children: [
                              Radio(
                                  value: 'Male',
                                  groupValue: 'gender',
                                  onChanged: (value) {}),
                              Text("Male",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .color,
                                      fontSize: 11.sp)),
                              Radio(
                                  value: 'Female',
                                  groupValue: 'gender',
                                  onChanged: (value) {}),
                              Text("Female",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .color,
                                      fontSize: 11.sp)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                // Contact Details Section
                Text(
                  "Contact details:",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                  ),
                ),
                SizedBox(height: 8.h),
                _buildTextField("E-mail", "eddykimonline@krmail.eu", context),
                SizedBox(height: 16.h),
                _buildTextField("Phone Number", "+144 638 4382 485", context),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    Text(
                      "Send mail and message about the trip details?",
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                          fontSize: 12.sp),
                    ),
                  ],
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 8),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Total",
                              style: TextStyle(
                                  color: Colors.grey[600], fontSize: 12.sp)),
                          Text("£86",
                              style: TextStyle(
                                  color: Color(0xFF0A3042),
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.toNamed(AppPages.PHONE_AUTH);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF66D2A8),
                          padding: EdgeInsets.symmetric(
                              vertical: 16.h, horizontal: 24.w),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r)),
                        ),
                        child: Text("Continue to pay",
                            style: TextStyle(
                                color: Colors.white, fontSize: 16.sp)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField(String label, String hintText, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
              color: Theme.of(context).textTheme.bodyMedium!.color,
              fontSize: 14.sp),
        ),
        SizedBox(height: 4.h),
        TextField(
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding:
                EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: Theme.of(context).dividerColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: Theme.of(context).dividerColor),
            ),
          ),
        ),
      ],
    );
  }
}
