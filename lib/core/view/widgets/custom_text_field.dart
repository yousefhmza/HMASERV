import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hmaserv/core/extensions/num_extensions.dart';

import '../../resources/resources.dart';
import '../views.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final String? description;
  final Color labelColor;
  final String? hintText;
  final Color? hintColor;
  final Color? fillColor;
  final Widget? prefix;
  final Widget? suffix;
  final FocusNode? focusNode;
  final bool readOnly;
  final bool obscureText;
  final bool? enabled;
  final bool? isDense;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final TextAlign? textAlign;
  final String? initialValue;
  final TextInputType? keyBoardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final void Function(String?)? onSaved;
  final void Function(String)? onSubmitted;
  final TextEditingController? controller;
  final List<TextInputFormatter>? formatters;
  final AutovalidateMode? autoValidateMode;
  final TextInputAction? textInputAction;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? prefixSuffixPadding;

  const CustomTextField({
    this.hintText,
    this.hintColor,
    this.label,
    this.description,
    this.labelColor = AppColors.black,
    this.prefix,
    this.fillColor,
    this.suffix,
    this.validator,
    this.readOnly = false,
    this.obscureText = false,
    this.keyBoardType,
    this.controller,
    this.focusNode,
    this.enabled,
    this.isDense,
    this.formatters,
    this.onChanged,
    this.onTap,
    this.onSaved,
    this.onSubmitted,
    this.textInputAction,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.textAlign,
    this.initialValue,
    this.autoValidateMode,
    this.contentPadding,
    this.prefixSuffixPadding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) CustomText(label!, color: AppColors.grey500, fontWeight: FontWeightManager.regular),
        if (label != null) const VerticalSpace(AppSize.s4),
        TextFormField(
          autovalidateMode: autoValidateMode,
          cursorColor: AppColors.black,
          textCapitalization: TextCapitalization.sentences,
          obscureText: obscureText,
          readOnly: readOnly,
          validator: validator,
          controller: controller,
          focusNode: focusNode,
          inputFormatters: formatters,
          onChanged: onChanged,
          onTap: onTap,
          onSaved: onSaved,
          textAlign: textAlign ?? TextAlign.start,
          maxLength: maxLength,
          onFieldSubmitted: onSubmitted,
          initialValue: initialValue,
          keyboardType: keyBoardType,
          maxLines: maxLines ?? 1,
          minLines: minLines ?? 1,
          enabled: enabled,
          textInputAction: textInputAction,
          style: const TextStyle(
            color: AppColors.black,
            fontFamily: FontConstants.fontFamily,
            fontSize: FontSize.s14,
            fontWeight: FontWeightManager.regular,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: Theme.of(context).inputDecorationTheme.hintStyle?.copyWith(color: hintColor),
            contentPadding:
                contentPadding ?? EdgeInsets.symmetric(horizontal: AppPadding.p8.w, vertical: AppPadding.p12.h),
            isDense: isDense,
            prefixIcon: prefix != null
                ? Padding(
                    padding: prefixSuffixPadding ??
                        EdgeInsetsDirectional.only(start: AppPadding.p12.w, end: AppPadding.p12.w),
                    child: prefix,
                  )
                : null,
            prefixIconConstraints: const BoxConstraints(minWidth: AppSize.s0, minHeight: AppSize.s0),
            suffixIcon: suffix != null
                ? Padding(padding: prefixSuffixPadding ?? EdgeInsets.all(AppPadding.p12.w), child: suffix)
                : null,
            suffixIconConstraints: const BoxConstraints(minWidth: AppSize.s0, minHeight: AppSize.s0),
          ),
        ),
      ],
    );
  }
}
