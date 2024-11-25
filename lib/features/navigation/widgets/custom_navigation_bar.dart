import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/navigation_controller.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Access the current theme dynamically

    return GetBuilder<NavigationController>(
      init: NavigationController(),
      builder: (controller) {
        return Container(
          height: 60.0,
          margin: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.0.h),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary, // Use theme surface color
            borderRadius: BorderRadius.circular(30.0).r,
            boxShadow: [
              BoxShadow(
                color: theme.shadowColor.withOpacity(0.1), // Use theme shadow
                offset: const Offset(0, 4),
                blurRadius: 10,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              controller.tabs.length,
              (index) {
                return _buildNavItem(
                  controller,
                  icon: controller.navigationItems[index]["icon"],
                  label: controller.navigationItems[index]["label"],
                  index: index,
                  theme: theme,
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavItem(
    NavigationController controller, {
    required IconData icon,
    required String label,
    required int index,
    required ThemeData theme,
  }) {
    final isSelected = controller.selectedIndex == index;

    return GestureDetector(
      onTap: () => controller.changeTab(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(
          horizontal: isSelected ? 16.0 : 0.0,
          vertical: 8.0,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? theme.colorScheme.surface // Use primary color for selected
              : theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected
                  ? theme.colorScheme.primary
                  : theme.iconTheme.color!,
              size: 24.0,
            ),
            if (isSelected) ...[
              const SizedBox(width: 8.0),
              Text(
                label,
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: theme.colorScheme.primary, // OnPrimary for text
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
