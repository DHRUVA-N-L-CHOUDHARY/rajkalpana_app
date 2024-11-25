import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controllers/wallet_listing_controller.dart';

class WalletListingView extends StatelessWidget {
  const WalletListingView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalletListingController>(
      init: WalletListingController(),
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
              "Wallet",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 20.sp,
              ),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 175.h,
                  margin: EdgeInsets.symmetric(vertical: 20.h),
                  child: Stack(
                    children: [
                      _buildWalletBalance(controller, context),
                      Positioned(
                        top: 120.h,
                        left: 140.w,
                        child: _buildAddButton(context),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                Text(
                  "Recent Transactions",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.h),
                Expanded(
                  child: _buildTransactionList(controller, context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Wallet Balance Widget
  Widget _buildWalletBalance(WalletListingController controller, BuildContext context) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 25.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "arrowPoints",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            "£26,400.00",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary,
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // Add Button Widget
  Widget _buildAddButton(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // Add button action
          },
          child: CircleAvatar(
            radius: 28.r,
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Icon(
              Icons.add,
              color: Theme.of(context).colorScheme.onPrimary,
              size: 28,
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          "Add",
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyLarge!.color,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  // Transaction List Widget
  Widget _buildTransactionList(WalletListingController controller, BuildContext context) {
    final transactions = [
      {
        "date": "19 Sep",
        "description": "Used for ticket",
        "amount": "-£50",
        "type": "debit"
      },
      {
        "date": "19 Sep",
        "description": "Money Added",
        "amount": "+£50",
        "type": "credit"
      },
      {
        "date": "19 Sep",
        "description": "Used for ticket",
        "amount": "-£50",
        "type": "debit"
      },
      {
        "date": "19 Sep",
        "description": "Used for ticket",
        "amount": "-£50",
        "type": "debit"
      },
    ];

    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      transaction['type'] == "debit"
                          ? Icons.arrow_back
                          : Icons.arrow_downward,
                      color: transaction['type'] == "debit"
                          ? Theme.of(context).colorScheme.error
                          : Theme.of(context).colorScheme.secondary,
                      size: 24.sp,
                    ),
                    SizedBox(width: 16.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transaction['date']!,
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyMedium!.color,
                            fontSize: 14.sp,
                          ),
                        ),
                        Text(
                          transaction['description']!,
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  transaction['amount']!,
                  style: TextStyle(
                    color: transaction['type'] == "debit"
                        ? Theme.of(context).colorScheme.error
                        : Theme.of(context).colorScheme.secondary,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
