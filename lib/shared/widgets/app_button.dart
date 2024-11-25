import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  final bool isLoading; // Loading indicator
  final double? borderRadius; // Custom border radius
  final double? fontSize; // Custom font size
  final IconData? icon;
  final double? width; // Optional icon in the button
  final bool isIconOnly; // Button with only an icon

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.padding,
    this.isLoading = false,
    this.borderRadius,
    this.fontSize,
    this.icon,
    this.width,
    this.isIconOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 12.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: isLoading
            ? SizedBox(
                height: 20.h,
                width: 20.h,
                child: CircularProgressIndicator(
                  color: textColor ?? Theme.of(context).colorScheme.onPrimary,
                  strokeWidth: 2.0,
                ),
              )
            : isIconOnly && icon != null
                ? Icon(
                    icon,
                    color: textColor ?? Theme.of(context).colorScheme.onPrimary,
                    size: fontSize ?? 20.sp,
                  )
                : Text(
                    text,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
      ),
    );
  }
}
