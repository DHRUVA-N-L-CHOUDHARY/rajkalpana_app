import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BusCard extends StatefulWidget {
  const BusCard({super.key});

  @override
  _BusCardState createState() => _BusCardState();
}

class _BusCardState extends State<BusCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row (Main Information)
          Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Icon(Icons.directions_bus,
                    color: Theme.of(context).colorScheme.onPrimary,
                    size: 20.sp),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Virgin Travels",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                    ),
                    Text(
                      "Volvo Multi Axle Semi Sleeper (2+2)",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Theme.of(context).textTheme.bodyMedium!.color,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Text(
                  "CHEAPEST",
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          // Main Details Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "6:50AM",
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Chennai CMBT",
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Theme.of(context).textTheme.bodyMedium!.color),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "4:05hrs",
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Theme.of(context).textTheme.bodyMedium!.color),
                  ),
                  Icon(Icons.directions_bus,
                      color: Theme.of(context).iconTheme.color, size: 16.sp),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "12:15PM",
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Bangalore BS",
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Theme.of(context).textTheme.bodyMedium!.color),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Divider(
            color: Theme.of(context).dividerColor,
            height: 1.h,
          ),
          SizedBox(height: 12.h),

          // Expandable Section
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _isExpanded ? "Less Details" : "More Details",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Icon(
                  _isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          if (_isExpanded)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Boarding & Dropping Points
                Text(
                  "Boarding & Dropping Points",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "Egmore Station (5:50AM, Chennai)\nBastion Bus Stand (10:15AM, Bangalore)",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Theme.of(context).textTheme.bodyMedium!.color,
                  ),
                ),
                SizedBox(height: 12.h),

                // Rest Stops
                Text(
                  "Rest Stops",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "Standby Cafe (7:45AM, Thiruvallur - 30 mins)",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Theme.of(context).textTheme.bodyMedium!.color,
                  ),
                ),
                SizedBox(height: 12.h),

                // Amenities
                Text(
                  "Amenities",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                  ),
                ),
                SizedBox(height: 8.h),
                Wrap(
                  spacing: 8.w,
                  runSpacing: 8.h,
                  children: [
                    _buildAmenityIcon(Icons.tv, "LED TV"),
                    _buildAmenityIcon(Icons.light, "Reading Lights"),
                    _buildAmenityIcon(Icons.wifi, "Free WiFi"),
                    _buildAmenityIcon(Icons.fastfood, "Snacks"),
                    _buildAmenityIcon(Icons.luggage, "Extra Luggage"),
                    _buildAmenityIcon(Icons.bed, "Bedsheets"),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildAmenityIcon(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 20.sp, color: Theme.of(context).colorScheme.primary),
        SizedBox(height: 4.h),
        Text(
          label,
          style: TextStyle(
            fontSize: 10.sp,
            color: Theme.of(context).textTheme.bodyMedium!.color,
          ),
        ),
      ],
    );
  }
}
