import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:raj_kalpana_travels/features/bus_listing/widgets/bus_card.dart';
import 'package:raj_kalpana_travels/routes/app_pages.dart';
import '../controllers/bus_listing_controller.dart';
import 'package:intl/intl.dart';

class BusListingView extends StatelessWidget {
  const BusListingView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GetBuilder<BusListingController>(
      init: BusListingController(),
      builder: (controller) {
        return Scaffold(
          body: Stack(
            children: [
              ListView(
                children: [
                  Container(
                    height: Get.height / 3.5,
                    color: theme.colorScheme.primary,
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.h, left: 8.w, right: 8.w),
                child: Column(
                  children: [
                    _buildHeader(controller, theme),
                    _buildDateSelector(controller, theme),
                    Expanded(child: _buildBusList(controller, theme)),
                  ],
                ),
              ),
              Positioned(
                bottom: 20.h,
                left: 0,
                right: 0,
                child: _buildFilterBar(controller, theme),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader(BusListingController controller, ThemeData theme) {
    return Container(
      height: (Get.height / 3) - 90.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back,
                    color: theme.colorScheme.onPrimary, size: 24.sp),
                onPressed: () => Get.back(),
              ),
              Icon(Icons.refresh,
                  color: theme.colorScheme.onPrimary, size: 24.sp),
            ],
          ),
          SizedBox(height: 16.h),
          // Route and icon information
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Chennai, TN",
                    style: theme.textTheme.bodyLarge!.copyWith(
                      color: theme.colorScheme.onPrimary.withOpacity(0.6),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "CHN",
                    style: theme.textTheme.bodyLarge!.copyWith(
                      color: theme.colorScheme.onPrimary,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 12.w),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (int i = 0; i < 10; i++)
                    Icon(
                      Icons.fiber_manual_record,
                      color: theme.colorScheme.onPrimary.withOpacity(0.6),
                      size: 4.sp,
                    ),
                  SizedBox(width: 4.w),
                  Icon(Icons.directions_bus,
                      color: theme.colorScheme.onPrimary.withOpacity(0.6),
                      size: 20.sp),
                  SizedBox(width: 4.w),
                  for (int i = 0; i < 10; i++)
                    Icon(
                      Icons.fiber_manual_record,
                      color: theme.colorScheme.onPrimary.withOpacity(0.6),
                      size: 4.sp,
                    ),
                ],
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Bangalore, KA",
                    style: theme.textTheme.bodyLarge!.copyWith(
                      color: theme.colorScheme.onPrimary.withOpacity(0.6),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "BAG",
                    style: theme.textTheme.bodyLarge!.copyWith(
                      color: theme.colorScheme.onPrimary,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDateSelector(BusListingController controller, ThemeData theme) {
    return SizedBox(
      height: 60.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          controller.dateList.length,
          (index) => GestureDetector(
            onTap: () {
              controller.updateSelectedIndex(index);
            },
            child: _buildDateOption(controller.dateList[index],
                index == controller.selectedIndex, theme),
          ),
        ),
      ),
    );
  }

  Widget _buildDateOption(DateTime date, bool isSelected, ThemeData theme) {
    String formattedDate =
        DateFormat(isSelected ? 'MMMM d' : 'MMM d').format(date);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          formattedDate,
          style: theme.textTheme.bodyLarge!.copyWith(
            color: isSelected
                ? theme.colorScheme.onPrimary
                : theme.colorScheme.onPrimary.withOpacity(0.6),
            fontSize: isSelected ? 16.sp : 14.sp,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        if (isSelected)
          Container(
            margin: EdgeInsets.only(top: 4.h),
            height: 2.h,
            width: 40.w,
            color: theme.colorScheme.secondary,
          ),
      ],
    );
  }

  Widget _buildBusList(BusListingController controller, ThemeData theme) {
    return ListView.builder(
      padding:
          EdgeInsets.only(bottom: 100.h, left: 16.w, right: 16.w, top: 10.h),
      itemCount: 3, // Example count, adjust as needed
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.toNamed(AppPages.SEAT_SELECTION);
          },
          child: BusCard(),
        );
      },
    );
  }

  // Widget _buildBusCard(BuildContext context) {
  //   return Container(
  //     margin: EdgeInsets.only(bottom: 16.h),
  //     padding: EdgeInsets.all(16.w),
  //     decoration: BoxDecoration(
  //       color: Theme.of(context).colorScheme.surface,
  //       borderRadius: BorderRadius.circular(12.r),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Theme.of(context).shadowColor.withOpacity(0.1),
  //           spreadRadius: 2,
  //           blurRadius: 8,
  //           offset: Offset(0, 2),
  //         ),
  //       ],
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Row(
  //           children: [
  //             CircleAvatar(
  //               radius: 20.r,
  //               backgroundColor: Theme.of(context).colorScheme.primary,
  //               child: Icon(Icons.directions_bus,
  //                   color: Theme.of(context).colorScheme.onPrimary,
  //                   size: 20.sp),
  //             ),
  //             SizedBox(width: 12.w),
  //             Expanded(
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     "Virgin Travels",
  //                     style: TextStyle(
  //                       fontSize: 16.sp,
  //                       fontWeight: FontWeight.bold,
  //                       color: Theme.of(context).textTheme.bodyLarge!.color,
  //                     ),
  //                   ),
  //                   Text(
  //                     "Volvo Multi Axle Semi Sleeper (2+2)",
  //                     style: TextStyle(
  //                       fontSize: 12.sp,
  //                       color: Theme.of(context).textTheme.bodyMedium!.color,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             Container(
  //               padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
  //               decoration: BoxDecoration(
  //                 color:
  //                     Theme.of(context).colorScheme.secondary.withOpacity(0.2),
  //                 borderRadius: BorderRadius.circular(4.r),
  //               ),
  //               child: Text(
  //                 "CHEAPEST",
  //                 style: TextStyle(
  //                   fontSize: 10.sp,
  //                   color: Theme.of(context).colorScheme.secondary,
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //         SizedBox(height: 16.h),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   "6:50AM",
  //                   style:
  //                       TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
  //                 ),
  //                 Text(
  //                   "Chennai CMBT",
  //                   style: TextStyle(
  //                       fontSize: 12.sp,
  //                       color: Theme.of(context).textTheme.bodyMedium!.color),
  //                 ),
  //               ],
  //             ),
  //             Column(
  //               children: [
  //                 Text(
  //                   "4:05hrs",
  //                   style: TextStyle(
  //                       fontSize: 12.sp,
  //                       color: Theme.of(context).textTheme.bodyMedium!.color),
  //                 ),
  //                 Icon(Icons.directions_bus,
  //                     color: Theme.of(context).iconTheme.color, size: 16.sp),
  //               ],
  //             ),
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.end,
  //               children: [
  //                 Text(
  //                   "12:15PM",
  //                   style:
  //                       TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
  //                 ),
  //                 Text(
  //                   "Bangalore BS",
  //                   style: TextStyle(
  //                       fontSize: 12.sp,
  //                       color: Theme.of(context).textTheme.bodyMedium!.color),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //         SizedBox(height: 16.h),
  //         Divider(
  //           color: Theme.of(context).dividerColor,
  //           height: 1.h,
  //         ),
  //         SizedBox(height: 12.h),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Row(
  //               children: [
  //                 Icon(Icons.star,
  //                     color: Theme.of(context).colorScheme.secondary,
  //                     size: 16.sp),
  //                 SizedBox(width: 4.w),
  //                 Text(
  //                   "4.4",
  //                   style: TextStyle(
  //                       fontSize: 12.sp,
  //                       color: Theme.of(context).textTheme.bodyMedium!.color),
  //                 ),
  //               ],
  //             ),
  //             Row(
  //               children: [
  //                 Icon(Icons.person,
  //                     color: Theme.of(context).iconTheme.color, size: 16.sp),
  //                 SizedBox(width: 4.w),
  //                 Text(
  //                   "34",
  //                   style: TextStyle(
  //                       fontSize: 12.sp,
  //                       color: Theme.of(context).textTheme.bodyMedium!.color),
  //                 ),
  //               ],
  //             ),
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.end,
  //               children: [
  //                 Text(
  //                   "£48",
  //                   style: TextStyle(
  //                     fontSize: 16.sp,
  //                     fontWeight: FontWeight.bold,
  //                     color: Theme.of(context).textTheme.bodyLarge!.color,
  //                   ),
  //                 ),
  //                 Text(
  //                   "from",
  //                   style: TextStyle(
  //                       fontSize: 12.sp,
  //                       color: Theme.of(context).textTheme.bodyMedium!.color),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildFilterBar(BusListingController controller, ThemeData theme) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildFilterItem(Icons.ac_unit_outlined, "A/C", theme),
          _buildFilterItem(Icons.airline_seat_flat, "Non-A/C", theme),
          _buildFilterItem(Icons.king_bed_outlined, "Sleeper", theme),
          _buildFilterItem(Icons.star_outline, "High-rated", theme),
          _buildFilterItem(Icons.filter_list, "", theme, isFilter: true),
        ],
      ),
    );
  }

  Widget _buildFilterItem(IconData icon, String label, ThemeData theme,
      {bool isFilter = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isFilter
                ? theme.colorScheme.secondary
                : theme.colorScheme.primary,
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(isFilter ? 6 : 4).dg,
          child: Icon(
            icon,
            color: theme.colorScheme.onPrimary,
            size: (isFilter ? 24 : 24).sp,
          ),
        ),
        if (!isFilter)
          Padding(
            padding: const EdgeInsets.only(top: 6.0).dg,
            child: Text(
              label,
              style: TextStyle(
                color: theme.colorScheme.onPrimary,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
      ],
    );
  }
}
