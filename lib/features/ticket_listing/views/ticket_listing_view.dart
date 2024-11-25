import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/ticket_listing_controller.dart';

class TicketListingView extends StatelessWidget {
  const TicketListingView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Access the app theme dynamically
    return GetBuilder<TicketListingController>(
      init: TicketListingController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: theme.colorScheme.surface,
            title: Text(
              "Bookings",
              style: theme.textTheme.bodyLarge!.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              _buildCustomTabBar(controller, theme),
              Expanded(child: _buildTabContent(controller, theme)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCustomTabBar(
      TicketListingController controller, ThemeData theme) {
    return Container(
      color: theme.colorScheme.surface,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTabItem("Active", 0, controller, theme),
          _buildTabItem("Completed", 1, controller, theme),
          _buildTabItem("Cancelled", 2, controller, theme),
        ],
      ),
    );
  }

  Widget _buildTabItem(String label, int index,
      TicketListingController controller, ThemeData theme) {
    bool isSelected = controller.selectedTabIndex == index;
    return GestureDetector(
      onTap: () => controller.updateSelectedTab(index),
      child: Container(
        width: 105.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
        margin: EdgeInsets.symmetric(horizontal: 8.w),
        decoration: BoxDecoration(
          color: isSelected
              ? theme.colorScheme.primary
              : theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Center(
          child: Text(
            label,
            style: theme.textTheme.bodyMedium!.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: isSelected
                  ? theme.colorScheme.onPrimary
                  : theme.colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent(
      TicketListingController controller, ThemeData theme) {
    List<Map<String, String>> tickets;
    String noTicketsMessage;

    // Determine which list to display based on selected tab
    switch (controller.selectedTabIndex) {
      case 0:
        tickets = controller.activeTickets;
        noTicketsMessage = "No active bookings found.";
        break;
      case 1:
        tickets = controller.completedTickets;
        noTicketsMessage = "No completed bookings found.";
        break;
      case 2:
        tickets = controller.cancelledTickets;
        noTicketsMessage = "No cancelled bookings found.";
        break;
      default:
        tickets = [];
        noTicketsMessage = "No bookings found.";
    }

    if (tickets.isEmpty) {
      return Center(
        child: Text(
          noTicketsMessage,
          style: theme.textTheme.bodyLarge!.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else {
      return ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        itemCount: tickets.length,
        itemBuilder: (context, index) {
          return _buildTicketCard(tickets[index], theme);
        },
      );
    }
  }

  Widget _buildTicketCard(Map<String, String> ticketData, ThemeData theme) {
    return GestureDetector(
      onTap: () {
        // Navigate to ticket details
        Get.toNamed(AppPages.TICKET_DETAILS);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(12.r),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStationInfo(
                  ticketData["from"]!,
                  ticketData["fromCode"]!,
                  theme,
                ),
                Column(
                  children: [
                    Text(
                      ticketData["duration"]!,
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: theme.colorScheme.primary.withOpacity(0.7),
                      ),
                    ),
                    Icon(Icons.directions_bus,
                        size: 16.sp, color: theme.iconTheme.color),
                  ],
                ),
                _buildStationInfo(
                  ticketData["to"]!,
                  ticketData["toCode"]!,
                  theme,
                  isRightAligned: true,
                ),
              ],
            ),
            Divider(color: theme.dividerColor, height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildIconRow(Icons.calendar_today, ticketData["date"]!, theme),
                _buildIconRow(Icons.person, ticketData["passenger"]!, theme),
                Text(
                  ticketData["price"]!,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStationInfo(
      String name, String code, ThemeData theme,
      {bool isRightAligned = false}) {
    return Column(
      crossAxisAlignment:
          isRightAligned ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: theme.textTheme.bodyMedium!.copyWith(
            color: theme.colorScheme.onSurface.withOpacity(0.7),
            fontSize: 12.sp,
          ),
        ),
        Text(
          code,
          style: theme.textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildIconRow(IconData icon, String label, ThemeData theme) {
    return Row(
      children: [
        Icon(icon, size: 16.sp, color: theme.iconTheme.color),
        SizedBox(width: 4.w),
        Text(
          label,
          style: theme.textTheme.bodyMedium!.copyWith(
            color: theme.colorScheme.onSurface.withOpacity(0.7),
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }
}
