import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../routes/app_pages.dart';
import '../controllers/offer_listing_controller.dart';

class OfferListingView extends StatelessWidget {
  const OfferListingView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OfferListingController>(
      init: OfferListingController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Theme.of(context).colorScheme.onPrimary),
              onPressed: () => Get.back(),
            ),
            title: Text(
              "Offers",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 20.sp,
              ),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              children: [
                _buildOfferList(controller, context),
              ],
            ),
          ),
        );
      },
    );
  }

  // Offer List Widget
  Widget _buildOfferList(OfferListingController controller, BuildContext context) {
    final offers = [
      {
        "code": "TOPG",
        "description": "TOP 15 USERS WILL GET 15% OFF",
        "tag": "NEW"
      },
      {
        "code": "AR50",
        "description": "FLAT 50%  FOR FIRST TIME USERS",
        "tag": ""
      },
      {
        "code": "GPAY100",
        "description": "USE GPAY AND EARN UPTO 150 AP",
        "tag": ""
      },
      {
        "code": "VISA25",
        "description": "VISA CARD USERS GET MIN 20%",
        "tag": "Expiring Soon"
      },
    ];

    return Expanded(
      child: ListView.builder(
        itemCount: offers.length,
        itemBuilder: (context, index) {
          final offer = offers[index];
          return GestureDetector(
            onTap: () {
              Get.toNamed(AppPages.OFFER_DETAILS);
            },
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.h),
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).dividerColor, width: 1),
                      borderRadius: BorderRadius.circular(8.r),
                      color: Theme.of(context).colorScheme.surface,
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).shadowColor.withOpacity(0.1),
                          blurRadius: 6,
                          spreadRadius: 2,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            offer['code']!,
                            style: TextStyle(
                              color: Theme.of(context).textTheme.bodyLarge!.color,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Text(
                            offer['description']!,
                            style: TextStyle(
                              color: Theme.of(context).textTheme.bodyMedium!.color,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (offer['tag']!.isNotEmpty)
                    Positioned(
                      right: 5.w,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: offer['tag'] == "NEW"
                              ? Theme.of(context).colorScheme.secondary
                              : Theme.of(context).colorScheme.error,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Text(
                          offer['tag']!,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
