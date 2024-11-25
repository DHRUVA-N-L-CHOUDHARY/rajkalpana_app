import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? contentPadding;
  final TextEditingController? controller;
  final TextInputType? keyBoardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? hintText;
  final FocusNode? focusNode;
  final TextStyle? hintStyle;
  final String? prefixText; // Optional prefix text
  final IconData? prefixIcon; // Optional prefix icon
  final Color? borderColor; // Border color customization
  final double? borderWidth; // Border width customization
  final bool isPassword;
  final InputDecoration? inputDecoration; // Support for password fields

  const AppTextField(
      {Key? key,
      this.margin,
      this.contentPadding,
      this.controller,
      this.keyBoardType,
      this.inputFormatters,
      this.hintText,
      this.focusNode,
      this.hintStyle,
      this.prefixText,
      this.prefixIcon,
      this.borderColor,
      this.borderWidth,
      this.isPassword = false,
      this.inputDecoration // Default is non-password field
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: borderColor ?? Theme.of(context).dividerColor,
          width: borderWidth ?? 1.0,
        ),
      ),
      child: Row(
        children: [
          // Prefix Icon or Text
          if (prefixIcon != null)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Icon(
                prefixIcon,
                color: Theme.of(context).hintColor,
                size: 20.sp,
              ),
            ),
          if (prefixText != null)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                prefixText!,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          // Text Field
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: keyBoardType,
              inputFormatters: inputFormatters,
              focusNode: focusNode,
              obscureText: isPassword, // Handles password masking
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
              decoration: inputDecoration ??
                  InputDecoration(
                    contentPadding: contentPadding ??
                        EdgeInsets.symmetric(vertical: 14.h, horizontal: 10.w),
                    border: InputBorder.none,
                    hintText: hintText,
                    hintStyle: hintStyle ??
                        Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Theme.of(context).hintColor),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
