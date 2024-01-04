import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/extensions/context_extenstion.dart';
import '../constants/_constants.dart';

class AppTextField extends HookWidget {
  final String? label;
  final String? hint;
  final String? initialValue;
  final bool obscureText;
  final InputBorder? border;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onTap;
  final void Function()? onEditingComplete;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextAlignVertical? textAlignVertical;
  final TextAlign? textAlign;
  final Widget? suffix;
  final Widget? prefix;
  final Widget? bottomRightWidget;
  final bool readOnly;
  final bool expands;
  final bool hasBorder;
  final int? minLines, maxLines, maxLength;
  final bool enabled;
  final Color? fillColor;
  final InputDecoration? decoration;

  const AppTextField({
    Key? key,
    this.label,
    this.hint,
    this.controller,
    this.validator,
    this.border,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.suffix,
    this.obscureText = false,
    this.prefix,
    this.initialValue,
    this.focusNode,
    this.readOnly = false,
    this.expands = false,
    this.hasBorder = true,
    this.minLines,
    this.maxLines,
    this.maxLength,
    this.enabled = true,
    this.onChanged,
    this.onFieldSubmitted,
    this.fillColor,
    this.onTap,
    this.onEditingComplete,
    this.decoration,
    this.textAlign,
    this.textAlignVertical,
    this.bottomRightWidget,
  })  : assert(initialValue == null || controller == null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final focusNode = this.focusNode ?? useFocusNode();
    return FormField<String?>(
      validator: validator,
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: hasBorder
                    ? Border.all(
                        color: context.cScheme.outline.withOpacity(.16),
                        width: 0.4,
                      )
                    : null,
              ),
              child: Column(
                children: [
                  TextFormField(
                    enabled: enabled,
                    controller: controller,
                    initialValue: initialValue,
                    onChanged: (val) {
                      state.didChange(val);
                      if (onChanged != null) onChanged!(val);
                    },
                    onFieldSubmitted: onFieldSubmitted,
                    onTap: onTap,
                    keyboardType: keyboardType,
                    cursorColor: context.cScheme.onSurface,
                    cursorWidth: 1,
                    textCapitalization: textCapitalization,
                    obscureText: obscureText,
                    obscuringCharacter: '●',
                    readOnly: readOnly,
                    focusNode: focusNode,
                    expands: expands,
                    maxLines: maxLines,
                    minLines: minLines,
                    // maxLength: maxLength,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(maxLength),
                    ],
                    textAlignVertical:
                        textAlignVertical ?? TextAlignVertical.bottom,
                    textAlign: textAlign ?? TextAlign.start,
                    onEditingComplete: onEditingComplete ??
                        () => FocusScope.of(context).nextFocus(),
                    style: context.tTheme.bodyLarge?.copyWith(
                      color: context.cScheme.onSurface,
                    ),
                    decoration: decoration ??
                        kOutlineDecoration(context).copyWith(
                          hintText: hint,
                          labelText: label,
                          suffixIcon: (suffix != null)
                              ? Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 10.w),
                                      child: suffix!,
                                    ),
                                  ],
                                )
                              : null,
                          prefixIcon: (prefix != null)
                              ? Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 10.r),
                                      child: prefix!,
                                    ),
                                  ],
                                )
                              : null,
                          enabled: enabled,
                          border: border,
                          alignLabelWithHint: maxLines != null &&
                              keyboardType == TextInputType.multiline,
                        ),
                  ),
                  if (bottomRightWidget != null)
                    Container(
                      alignment: Alignment.bottomRight,
                      padding: EdgeInsets.all(11.r),
                      child: bottomRightWidget,
                    )
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  static InputDecoration kOutlineDecoration(BuildContext context) =>
      InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 13.w),
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        labelStyle: context.tTheme.bodyLarge?.copyWith(
          color: context.cScheme.onSurface,
        ),
        floatingLabelStyle: context.tTheme.bodyLarge?.copyWith(
          color: context.cScheme.onSurface,
        ),
        hintStyle: context.tTheme.bodyLarge?.copyWith(
          color: context.cScheme.onSurface,
        ),
      );
}

class AppDropdownField<T extends Object> extends HookWidget {
  final List<T> items;
  final T? value;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;
  final Widget Function(T)? customItem;
  final String Function(T)? displayItem;
  final String? label, hint;
  final String? headingText;
  final Widget? prefix;
  final FocusNode? focusNode;
  final bool enabled;
  final Color? fillColor;
  final bool hasBorder;

  const AppDropdownField({
    Key? key,
    required this.items,
    required this.value,
    this.onChanged,
    this.validator,
    this.label,
    this.hint,
    this.headingText,
    this.prefix,
    this.enabled = true,
    this.fillColor,
    this.focusNode,
    this.customItem,
    this.displayItem,
    this.hasBorder = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final focusNode = this.focusNode ?? useFocusNode();
    final isOpen = useState(false);
    return FormField<T?>(
      validator: validator,
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => isOpen.value = !isOpen.value,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: hasBorder
                      ? Border.all(
                          color: context.cScheme.outline.withOpacity(.16),
                          width: 0.4,
                        )
                      : null,
                ),
                child: DropdownButtonFormField<T>(
                  dropdownColor: context.cScheme.outline.withOpacity(.16),
                  borderRadius: BorderRadius.circular(10),
                  alignment: Alignment.bottomCenter,
                  elevation: 0,
                  items: const [],
                  isExpanded: true,
                  onChanged: (val) {
                    state.didChange(val);
                    if (onChanged != null) onChanged!(val);
                  },
                  value: value,
                  focusNode: focusNode,
                  icon: const Icon(
                    Icons.arrow_drop_down_sharp,
                    size: 0,
                  ),
                  style: context.tTheme.bodyLarge?.copyWith(
                    color: context.cScheme.onSurface,
                  ),
                  decoration: AppTextField.kOutlineDecoration(context).copyWith(
                    hintText: hint,
                    labelText: label,
                    prefixIcon: prefix,
                    enabled: enabled,
                    suffixIcon: SizedBox(
                      width: 50.w,
                      child: Align(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          AppSvgAssets.arrowDown,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (isOpen.value) ...[
              Spacing.vertSmall(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: context.cScheme.outline.withOpacity(.16),
                ),
                clipBehavior: Clip.hardEdge,
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const Divider(height: 3),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    if (customItem != null) {
                      return customItem!(item);
                    }
                    return GestureDetector(
                      onTap: () {
                        state.didChange(item);
                        if (onChanged != null) onChanged!(item);
                        isOpen.value = !isOpen.value;
                      },
                      child: Padding(
                        padding: REdgeInsets.all(16),
                        child: Text(
                          displayItem != null
                              ? displayItem!(item)
                              : item.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: context.tTheme.bodyLarge?.copyWith(
                            color: context.cScheme.onSurface,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
