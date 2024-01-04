import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/extensions/context_extenstion.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final Color? labelColor, borderColor, disabledColor;
  final double? width, height, borderRadius;
  final bool isCollapsed, isDisabled;
  final bool hasShadow, hasBorder, isBusy, showFeedback;
  final EdgeInsetsGeometry? padding;
  final Widget? customChild, prefixWidget, suffixWidget;

  const AppButton({
    Key? key,
    required this.label,
    this.onTap,
    this.onLongPress,
    this.width,
    this.height,
    this.customChild,
    this.labelColor,
    this.disabledColor,
    this.borderColor,
    this.isCollapsed = false,
    this.hasShadow = false,
    this.hasBorder = false,
    this.isBusy = false,
    this.isDisabled = false,
    this.showFeedback = true,
    this.borderRadius,
    this.padding,
    this.prefixWidget,
    this.suffixWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? (isCollapsed ? null : double.maxFinite),
      height: height ?? (isCollapsed ? null : 48.h),
      child: MaterialButton(
        onPressed: isDisabled ? null : () => isBusy ? null : onTap?.call(),
        onLongPress:
            isDisabled ? null : () => isBusy ? null : onLongPress?.call(),
        color: context.cScheme.secondaryContainer.withOpacity(.16),
        elevation: hasShadow ? 5 : 0,
        clipBehavior: Clip.hardEdge,
        highlightElevation: showFeedback ? 4 : 0,
        padding: padding ?? EdgeInsets.all(10.r),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius?.r ?? 8.r),
          side: hasBorder
              ? BorderSide(
                  color: borderColor ?? Colors.grey[400]!,
                  width: 1.r,
                )
              : BorderSide.none,
        ),
        child: Builder(
          builder: (context) {
            return FittedBox(
              child: Row(
                children: [
                  if (prefixWidget != null)
                    Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: prefixWidget,
                    ),
                  Center(
                    child: Text(
                      label,
                      textAlign: TextAlign.center,
                      style: context.tTheme.labelLarge?.copyWith(
                        color: context.cScheme.onSecondaryContainer,
                      ),
                    ),
                  ),
                  if (suffixWidget != null)
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: suffixWidget,
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
