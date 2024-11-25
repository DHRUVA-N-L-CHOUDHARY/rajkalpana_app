import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          body: ListView(
            children: [
              _buildHeader(controller),
              _buildSearchBox(controller, context),
              _buildPastBookings(controller, context),
              _buildRecentSearches(controller, context),
              _buildPopularRoutes(controller, context),
              SizedBox(height: 30.h),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader(HomeController controller) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                "Book your bus tickets easily.",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
          GestureDetector(
              onTap: () {
                Get.offNamed(AppPages.PHONE_AUTH);
              },
              child: Icon(Icons.login, color: Colors.black)),
        ],
      ),
    );
  }

  Widget _buildSearchBox(HomeController controller, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 24.h),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context)
                  .shadowColor
                  .withOpacity(0.15), // Softer shadow
              spreadRadius: 2,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              children: [
                _buildTextFieldRow(Icons.directions_bus, 'from', controller,
                    context, controller.sourceController.value),
                SizedBox(height: 10.h),
                _buildTextFieldRow(Icons.directions_bus, 'to', controller,
                    context, controller.destinationController.value),
                SizedBox(height: 10.h),
                _buildTextFieldRow(Icons.calendar_today, 'date', controller,
                    context, controller.dateController.value),
                SizedBox(height: 20.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(AppPages.BUS_LISTING);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Text(
                      'Search Buses',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              right: 8.w,
              top: 42.h,
              child: _buildSwapButton(controller, context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFieldRow(
    IconData icon,
    String hint,
    HomeController controller,
    BuildContext context,
    TextEditingController textEditingController,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.8),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.secondary),
          SizedBox(width: 8.w),
          Expanded(
            child: TextField(
              readOnly: true,
              onTap: () async {
                if (hint == 'from' || hint == 'to') {
                  var result = await Get.toNamed(AppPages.CITIES_SEARCH,
                      arguments: {
                        "type": hint == "from" ? "source" : "destination"
                      });
                  textEditingController.text = result;
                } else if (hint == 'date') {
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2101),
                  );
                  if (selectedDate != null) {
                    controller.updateDate(
                      DateFormat('yyyy-MM-dd').format(selectedDate),
                    );
                  }
                }
              },
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                  color: Theme.of(context).hintColor,
                  fontSize: 16.sp,
                ),
                border: InputBorder.none,
                isDense: true,
              ),
              style: TextStyle(
                fontSize: 16.sp,
                color: Theme.of(context).textTheme.bodyMedium!.color,
              ),
              controller: hint == 'date'
                  ? TextEditingController(text: controller.selectedDate.value)
                  : textEditingController,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwapButton(HomeController controller, BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.swapFunction();
      },
      child: Container(
        height: 30.h,
        width: 30.h,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Icon(
          Icons.swap_vert,
          color: Theme.of(context).colorScheme.onPrimary,
          size: 20.sp,
        ),
      ),
    );
  }

  Widget _buildPopularRoutes(HomeController controller, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Text(
            "Popular Routes",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color:
                  Theme.of(context).colorScheme.secondary, // Themed text color
            ),
          ),
        ),
        SizedBox(height: 12.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              3,
              (index) => _buildRouteCard(index, controller, context),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPastBookings(HomeController controller, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Text(
            "Previous Travels",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color:
                  Theme.of(context).textTheme.bodyMedium!.color, // Themed text
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              3,
              (index) => _buildRouteCard(
                  index, controller, context), // Reuse the same card
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRouteCard(
      int routeIndex, HomeController controller, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, bottom: 8.h, right: 8.w),
      child: Container(
        width: 220.w,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
              color: Theme.of(context).dividerColor, width: 1), // Subtle border
          boxShadow: [
            BoxShadow(
              color: Theme.of(context)
                  .shadowColor
                  .withOpacity(0.08), // Even softer shadow
              spreadRadius: 2,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: Row(
            children: [
              // Image
              Container(
                width: 70.w,
                height: 70.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/popular_route_${routeIndex + 1}.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              // Route Info
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mumbai ➔ Bangalore",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                      maxLines: 1, // Limit text overflow
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Text(
                          "from",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Theme.of(context)
                                .colorScheme
                                .primary, // Primary color for "from"
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          "£89",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .color, // Price text color
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// Recent Searches Section
  Widget _buildRecentSearches(HomeController controller, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Text(
            "Recent Searches",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .color, // Text color from theme
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              3,
              (index) => _buildRouteCard(index, controller,
                  context), // Reuse the same card for Recent Searches
            ),
          ),
        ),
      ],
    );
  }
}
