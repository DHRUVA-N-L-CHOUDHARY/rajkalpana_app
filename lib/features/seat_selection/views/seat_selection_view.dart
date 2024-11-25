import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/seat_selection_controller.dart';

class SeatSelectionView extends StatelessWidget {
  const SeatSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SeatSelectionController>(
      init: SeatSelectionController(),
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
              "Acela",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h, bottom: 16.h ),
                    color: Theme.of(context).colorScheme.primary,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "5:50AM",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Chennai CMBT",
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimary
                                    .withOpacity(0.8),
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "3:05hrs",
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimary
                                    .withOpacity(0.8),
                                fontSize: 14.sp,
                              ),
                            ),
                            Icon(
                              Icons.directions_bus,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimary
                                  .withOpacity(0.8),
                              size: 18.sp,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "10:15AM",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Bangalore BS",
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimary
                                    .withOpacity(0.8),
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    color: Theme.of(context).colorScheme.primary,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "November 27",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "4.4",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 14.sp,
                              ),
                            ),
                            SizedBox(width: 4.w),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 18.sp,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Seat Selection UI Coming Soon!',
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: Theme.of(context).textTheme.bodyLarge!.color),
                  ),
                ),
              ),
              _buildBottomBar(controller, context),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBottomBar(
      SeatSelectionController controller, BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Selected Seat Information
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sleeper, Seater",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                "S8, W11", // Example seat numbers
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                ),
              ),
            ],
          ),
          // Confirm Button
          ElevatedButton(
            onPressed: () {
              // Handle confirmation action
              Get.toNamed(AppPages.PASSENGER_DETAILS);
              Get.snackbar(
                "Confirmed",
                "Seats have been selected!",
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Theme.of(context).colorScheme.primary,
                colorText: Theme.of(context).colorScheme.onPrimary,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: Text(
              "Confirm",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
