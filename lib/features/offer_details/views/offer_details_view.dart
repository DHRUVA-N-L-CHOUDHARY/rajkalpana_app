import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controllers/offer_details_controller.dart';

class OfferDetailsView extends StatelessWidget {
  const OfferDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OfferDetailsController>(
      init: OfferDetailsController(),
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
              "Offer Details",
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildOfferCard(controller, context),
                SizedBox(height: 24.h),
                _buildSectionTitle("Usage", context),
                SizedBox(height: 8.h),
                _buildUsageList(context),
                SizedBox(height: 24.h),
                _buildSectionTitle("Terms & Conditions", context),
                SizedBox(height: 8.h),
                _buildTermsList(context),
                const Spacer(),
                _buildClaimOfferButton(context),
              ],
            ),
          ),
        );
      },
    );
  }

  // Offer Card Widget
  Widget _buildOfferCard(OfferDetailsController controller, BuildContext context) {
    return Padding(
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
                    "VISA25",
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
                    "VISA CARD USERS GET MIN 20%",
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyMedium!.color,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 5.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Text(
                "EXPIRING SOON",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontSize: 12.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Theme.of(context).textTheme.bodyLarge!.color,
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildUsageList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(4, (index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: Text(
            "${index + 1}. Lorem ipsum dolor sit amet consectetur.",
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyMedium!.color,
              fontSize: 14.sp,
            ),
          ),
        );
      }),
    );
  }

  // Terms & Conditions List Widget
  Widget _buildTermsList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(4, (index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: Text(
            "${index + 1}. Lorem ipsum dolor sit amet consectetur.",
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyMedium!.color,
              fontSize: 14.sp,
            ),
          ),
        );
      }),
    );
  }

  // Claim Offer Button Widget
  Widget _buildClaimOfferButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            padding: EdgeInsets.symmetric(vertical: 14.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          onPressed: () {
            // Claim offer action
          },
          child: Text(
            "Claim Offer",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
