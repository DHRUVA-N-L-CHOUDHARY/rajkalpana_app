import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Access the app theme dynamically

    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) {
        return Scaffold(
          body: ListView(
            children: [
              Container(
                color: theme.colorScheme.primary,
                height: 2 * Get.height / 7,
                child: _buildProfileHeader(controller, theme),
              ),
              SizedBox(height: 16.h),
              _buildOptionsList(theme),
            ],
          ),
        );
      },
    );
  }

  Widget _buildProfileHeader(ProfileController controller, ThemeData theme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "Profile",
          style: theme.textTheme.bodyLarge!.copyWith(
            fontSize: 22.sp,
            color: theme.colorScheme.onPrimary,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Profile Image
            CircleAvatar(
              radius: 40.r,
              backgroundColor: theme.colorScheme.surface, // Placeholder color
            ),
            SizedBox(width: 16.w),
            // Name and Contact Details
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Kayal Vizhi",
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  "+41 6232 283 8324",
                  style: theme.textTheme.bodyMedium!.copyWith(
                    fontSize: 14.sp,
                    color: theme.colorScheme.onPrimary.withOpacity(0.7),
                  ),
                ),
              ],
            ),
            SizedBox(width: 8.w),
            IconButton(
              icon: Icon(Icons.edit, color: theme.colorScheme.onPrimary),
              onPressed: () {
                Get.toNamed(AppPages.EDIT_PROFILE);
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOptionsList(ThemeData theme) {
    final options = [
      {
        "icon": Icons.confirmation_number_outlined,
        "label": "Bookings",
        "onTap": AppPages.TICKET_LISTING,
      },
      {
        "icon": Icons.people_outline,
        "label": "Passengers list",
        "onTap": AppPages.PASSENGER_LISTING,
      },
      {
        "icon": Icons.account_balance_wallet_outlined,
        "label": "Wallet",
        "onTap": AppPages.WALLET_LISTING,
      },
      {
        "icon": Icons.local_offer_outlined,
        "label": "Offers",
        "onTap": AppPages.OFFER_LISTING,
      },
      {
        "icon": Icons.info_outline,
        "label": "FAQ's & Support",
        "onTap": AppPages.FAQ_SUPPORT,
      },
      {
        "icon": Icons.help_outline,
        "label": "About Us",
        "onTap": AppPages.ABOUT_US,
      },
      {
        "icon": Icons.logout,
        "label": "Logout",
        "onTap": AppPages.TICKET_LISTING,
      },
      {
        "icon": Icons.rate_review,
        "label": "Rate App",
        "onTap": AppPages.TICKET_LISTING,
      },
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: options.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final option = options[index];
          return Column(
            children: [
              ListTile(
                leading: Icon(
                  option["icon"] as IconData?,
                  color: theme.colorScheme.primary,
                  size: 30.sp,
                ),
                title: Text(
                  option["label"].toString(),
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                  size: 16.sp,
                ),
                onTap: () => Get.toNamed(option['onTap'].toString()),
              ),
              if (index != options.length - 1)
                Divider(height: 1.h, color: theme.dividerColor),
            ],
          );
        },
      ),
    );
  }

  // Bottom Navigation
  Widget _buildBottomNavigation(ProfileController controller, ThemeData theme) {
    int _selectedIndex = 2;
    return Padding(
      padding: EdgeInsets.only(left: 40.w, right: 40.w, bottom: 20.h),
      child: Container(
        height: 60.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(AppPages.HOME);
              },
              child: _buildNavItem(
                  Icons.home, "Home", 0, _selectedIndex, controller, theme),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppPages.TICKET_LISTING);
              },
              child: _buildNavItem(Icons.confirmation_number_outlined,
                  "Bookings", 1, _selectedIndex, controller, theme),
            ),
            _buildNavItem(
                Icons.person, "Profile", 2, _selectedIndex, controller, theme),
          ],
        ),
      ),
    );
  }

  // Individual Navigation Item
  Widget _buildNavItem(IconData icon, String label, int index,
      int selectedIndex, ProfileController controller, ThemeData theme) {
    final isSelected = selectedIndex == index;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.symmetric(
          horizontal: isSelected ? 16.w : 0, vertical: 8.h),
      decoration: BoxDecoration(
        color: isSelected ? theme.colorScheme.surface : Colors.transparent,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: isSelected
                ? theme.colorScheme.primary
                : theme.colorScheme.onPrimary,
            size: 24.sp,
          ),
          if (isSelected) ...[
            SizedBox(width: 8.w),
            Text(
              label,
              style: theme.textTheme.bodyLarge!.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
