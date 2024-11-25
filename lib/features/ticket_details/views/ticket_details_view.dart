import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travel_bus_app/shared/utils/constants.dart';
import '../controllers/ticket_details_controller.dart';

class TicketDetailsView extends StatelessWidget {
  const TicketDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GetBuilder<TicketDetailsController>(
      init: TicketDetailsController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: theme.colorScheme.primary,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: theme.colorScheme.onPrimary),
              onPressed: () => Get.back(),
            ),
            title: Text(
              "Ticket Details",
              style: theme.textTheme.bodyLarge!.copyWith(
                color: theme.colorScheme.onPrimary,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          backgroundColor: theme.colorScheme.primary,
          body: ListView(
            children: [
              Center(
                child: Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: theme.shadowColor.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildTicketHeader(theme),
                      Divider(thickness: 1, color: theme.dividerColor),
                      SizedBox(height: 8.h),
                      _buildTicketDetailsGrid(theme),
                      Divider(thickness: 1, color: theme.dividerColor),
                      _buildBarcodeSection(theme),
                    ],
                  ),
                ),
              ),
              _buildRestStopsAndHelpSection(theme),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTicketHeader(ThemeData theme) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Column(
        children: [
          // Logo and Travel Info
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                appConst + AppImages.kAppIconNamed,
                height: 40.h,
              ),
              SizedBox(width: 8.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Acela",
                    style: theme.textTheme.bodyLarge!.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  Text(
                    "Mercedes Benz Multi-Axle A/C Sleeper (2+1)",
                    style: theme.textTheme.bodyMedium!.copyWith(
                      fontSize: 10.sp,
                      color: theme.colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Divider(thickness: 1, color: theme.dividerColor),
          SizedBox(height: 16.h),
          // Departure and Arrival Info
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStationInfo("CHENNAI CMBT", "Oct 10, 5:50am", theme),
              Icon(Icons.directions_bus,
                  color: theme.iconTheme.color, size: 24.sp),
              _buildStationInfo("BANGALORE BS", "Oct 10, 11:15am", theme),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStationInfo(String station, String dateTime, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          station,
          style: theme.textTheme.bodyLarge!.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          dateTime,
          style: theme.textTheme.bodyMedium!.copyWith(
            fontSize: 12.sp,
            color: theme.colorScheme.onSurface.withOpacity(0.7),
          ),
        ),
      ],
    );
  }

  Widget _buildTicketDetailsGrid(ThemeData theme) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTicketDetailItem("Passengers", "2 Adults", theme),
              _buildTicketDetailItem("Seat No.", "S11, W10", theme),
              _buildTicketDetailItem("Ticket No.", "42WLd94", theme),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTicketDetailItem(
                  "Passenger Name", "Satoshi, Winlander", theme),
              _buildTicketDetailItem("Ticket Fare", "£89", theme),
              _buildTicketDetailItem("Rest Stops", "1 Stop", theme),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            "Ticket Status : CONFIRMED",
            style: theme.textTheme.bodyMedium!.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTicketDetailItem(String title, String value, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.bodyMedium!.copyWith(
            fontSize: 12.sp,
            color: theme.colorScheme.onSurface.withOpacity(0.7),
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          value,
          style: theme.textTheme.bodyLarge!.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: theme.colorScheme.primary,
          ),
        ),
      ],
    );
  }

  Widget _buildBarcodeSection(ThemeData theme) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 8.h, bottom: 4.h),
          height: 60.h,
          width: double.infinity,
          color: theme.colorScheme.surface,
          child: Center(
            child: Text(
              "||||||||||||||||||||||||||||||||||",
              style: theme.textTheme.bodyLarge!.copyWith(
                fontSize: 24.sp,
                letterSpacing: 2,
                color: theme.colorScheme.onSurface.withOpacity(0.5),
              ),
            ),
          ),
        ),
        Text(
          "Show this to the driver in bus",
          style: theme.textTheme.bodyMedium!.copyWith(
            fontSize: 12.sp,
            color: theme.colorScheme.onSurface.withOpacity(0.7),
          ),
        ),
      ],
    );
  }

// Function to build the Rest Stops and Help section
  Widget _buildRestStopsAndHelpSection(ThemeData theme) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Rest Stops",
            style: theme.textTheme.bodyLarge!.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onBackground,
            ),
          ),
          SizedBox(height: 12.h),
          // Rest Stops List
          _buildRestStopItem(
            "Standby Cafe",
            "7:45AM, Thiruvallur",
            Icons.wifi,
            Icons.local_cafe,
            Icons.local_restaurant,
            "30mins",
            theme,
          ),
          SizedBox(height: 8.h),
          _buildRestStopItem(
            "Weird Bakery",
            "9:00AM, Mysore",
            Icons.wifi,
            Icons.local_cafe,
            Icons.local_restaurant,
            "30mins",
            theme,
          ),
          SizedBox(height: 24.h),
          // Help Section
          _buildHelpSection(true, theme),
        ],
      ),
    );
  }

  Widget _buildHelpSection(bool isJourneyActive, ThemeData theme) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Help",
            style: theme.textTheme.bodyLarge!.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onBackground,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              // "Chat with us" button
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.chat_bubble_outline,
                    color: theme.colorScheme.primary),
                label: Text(
                  "Chat with us",
                  style: theme.textTheme.bodyMedium!.copyWith(
                    fontSize: 14.sp,
                    color: theme.colorScheme.primary,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.surface,
                  elevation: 0,
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              // Conditional Button
              if (isJourneyActive)
                ElevatedButton.icon(
                  onPressed: () {
                    // Cancel Ticket action
                  },
                  icon: Icon(Icons.cancel, color: theme.colorScheme.onPrimary),
                  label: Text(
                    "Cancel Ticket",
                    style: theme.textTheme.bodyMedium!.copyWith(
                      fontSize: 14.sp,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    elevation: 0,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                )
            ],
          ),
          if (!isJourneyActive) _buildRateThisBus(theme),
        ],
      ),
    );
  }

// Helper function to build the Rate this bus section
  Widget _buildRateThisBus(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.h),
        Text(
          "Rate this bus",
          style: theme.textTheme.bodyLarge!.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onBackground,
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          children: List.generate(5, (index) {
            return Icon(
              Icons.star_border,
              color: theme.colorScheme.primary,
              size: 24.sp,
            );
          }),
        ),
      ],
    );
  }

// Helper function to build each rest stop item
  Widget _buildRestStopItem(
    String title,
    String subtitle,
    IconData icon1,
    IconData icon2,
    IconData icon3,
    String duration,
    ThemeData theme,
  ) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.orange[100],
                radius: 14,
                child: Icon(
                  Icons.flash_on,
                  color: Colors.orange,
                  size: 16.sp,
                ),
              ),
              SizedBox(width: 8.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.bodyLarge!.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      fontSize: 12.sp,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Icon(icon1, color: theme.iconTheme.color, size: 16.sp),
              SizedBox(width: 6.w),
              Icon(icon2, color: theme.iconTheme.color, size: 16.sp),
              SizedBox(width: 6.w),
              Icon(icon3, color: theme.iconTheme.color, size: 16.sp),
              SizedBox(width: 8.w),
              Text(
                duration,
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontSize: 12.sp,
                  color: theme.colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
