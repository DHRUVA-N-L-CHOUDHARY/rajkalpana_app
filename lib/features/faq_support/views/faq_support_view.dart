import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_bus_app/shared/utils/constants.dart';
import '../controllers/faq_support_controller.dart';

class FaqSupportView extends StatelessWidget {
  const FaqSupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FaqSupportController>(
      init: FaqSupportController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            elevation: 0,
            iconTheme:
                IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
            title: Text(
              'FAQ & Support',
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
                TextField(
                  onChanged: controller.onSearchChanged,
                  style: TextStyle(fontSize: 16.sp),
                  decoration: InputDecoration(
                    hintText: 'Search for FAQ’s',
                    hintStyle: TextStyle(
                      color: Theme.of(context).hintColor,
                      fontSize: 16.sp,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          BorderSide(color: Theme.of(context).dividerColor),
                    ),
                    prefixIcon: Icon(Icons.search,
                        color: Theme.of(context).iconTheme.color),
                  ),
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: ListView(
                    children: [
                      _buildFaqItem(
                          'How do I change my password?', controller, context),
                      SizedBox(height: 10.h),
                      _buildFaqItem(
                          'How to change payment methods', controller, context),
                      SizedBox(height: 20.h),
                      Text(
                        'Issue with recent bookings?',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                        ),
                      ),
                      SizedBox(
                        height: 120.h,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _buildRecentBookingCard(
                                'Mumbai',
                                'Banglore',
                                '19th Sep 2022',
                                'Acela Travels',
                                appConst + AppImages.kAppIconNamed,
                                context),
                            SizedBox(width: 10.w),
                            _buildRecentBookingCard(
                                'Banglore',
                                'Mysore',
                                '12th Oct 2022',
                                'Metro Bus',
                                appConst + AppImages.kAppIconNamed,
                                context),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'Need more help?',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      _buildHelpOption(Icons.call, 'Call us now', context),
                      SizedBox(height: 10.h),
                      _buildHelpOption(
                          Icons.chat, 'Chat with our agent', context),
                      SizedBox(height: 10.h),
                      _buildHelpOption(
                          Icons.email, 'Mail your issue to us', context),
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

  Widget _buildFaqItem(
      String question, FaqSupportController controller, BuildContext context) {
    return GestureDetector(
      onTap: () => controller.toggleFaq(question),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ExpansionTile(
          title: Text(
            question,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
          ),
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Text(
                'Lorem ipsum dolor sit amet consectetur. Non felis nec tortor tempus blandit quis lacus. Convallis sodales malesuada congue enim ac convallis. Pellentesque magna nisl in facilisi tristique ligula.',
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
  }

  Widget _buildRecentBookingCard(String from, String to, String date,
      String travelName, String imagePath, BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 2,
      child: Container(
        width: 240.w,
        padding: EdgeInsets.all(8.w),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                width: 60.w,
                height: 60.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '$from ➞ $to',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyLarge!.color,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        date,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                      Text(
                        travelName,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
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
    );
  }

  Widget _buildHelpOption(IconData icon, String title, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
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
