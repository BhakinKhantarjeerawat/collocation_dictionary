import 'package:collocation_dictionary/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class MyTextField extends StatelessWidget {
  // const MyTextFormField({Key? key}) : super(key: key);
  final EdgeInsetsGeometry? contentPadding;
  final String? hintText;
  final InputDecoration? inputDecoration;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final void Function(String?)? onFieldSubmitted;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSaved;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final AutovalidateMode? autoValidateMode;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final int? minLines;
  final int? maxLines;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final BorderSide? borderSide;
  final bool readOnly;
  final int maxLength;
  final bool counterStyle;
  final bool counterText;
  final List<TextInputFormatter>? textInputFormatter;
  final FocusNode? focusNode;
  const MyTextField(
      {Key? key, this.hintText,
      this.inputDecoration,
      this.suffixIcon,
      this.obscureText = false,
      this.contentPadding,
      this.onFieldSubmitted,
      this.onChanged,
      this.onSaved,
      this.validator,
      this.autoValidateMode,
      this.controller,
      this.prefixIcon,
      this.onTap,
      this.textInputAction,
      this.keyboardType,
      this.minLines,
      this.maxLines,
      this.hintStyle,
      this.textStyle,
      this.borderSide, this.textInputFormatter,
      this.readOnly = false,
      required this.maxLength,
      this.counterStyle = false,
      this.counterText = false,
      this.focusNode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      inputFormatters: textInputFormatter,
      maxLength: maxLength,
      readOnly: readOnly,
      style: textStyle,
      maxLines: maxLines,
      minLines: minLines,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onTap: onTap,
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      decoration: inputDecoration ??
          InputDecoration(
            counterStyle: counterStyle ? null : const TextStyle(height: double.minPositive,),
            counterText: counterText ? null : '',
            contentPadding: contentPadding ?? const EdgeInsets.all(10.0),
            hintText: hintText,
            hintStyle: hintStyle ??
                const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: AppTheme.gray30),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
            enabledBorder: !readOnly ? OutlineInputBorder(
                borderSide: borderSide ?? const BorderSide(
              color: AppTheme.gray30,
              width: 1.0,
            )) : OutlineInputBorder(
                borderSide: borderSide ?? const BorderSide(
                  color: AppTheme.transparent,
                  width: 1.0,
                )),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppTheme.orange,
                width: 1,
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppTheme.alert,
                width: 1,
              ),
            ),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon, filled: readOnly,
            fillColor: readOnly ? AppTheme.gray20 : AppTheme.white,
          ),
      onChanged: onChanged,
      onSaved: onSaved,
      onFieldSubmitted: onFieldSubmitted,
      autovalidateMode: autoValidateMode,
    );
  }
}

class MyTextFormFieldNoMaxLength extends StatelessWidget {
  // const MyTextFormField({Key? key}) : super(key: key);
  final EdgeInsetsGeometry? contentPadding;
  final String? hintText;
  final InputDecoration? inputDecoration;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final void Function(String?)? onFieldSubmitted;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSaved;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final AutovalidateMode? autoValidateMode;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final int? minLines;
  final int? maxLines;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final BorderSide? borderSide;
  final bool readOnly;
  final bool counterStyle;
  final bool counterText;
  final List<TextInputFormatter>? textInputFormatter;

  const MyTextFormFieldNoMaxLength({Key? key,
    this.hintText,
    this.inputDecoration,
    this.suffixIcon,
    this.obscureText = false,
    this.contentPadding,
    this.onFieldSubmitted,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.autoValidateMode,
    this.controller,
    this.prefixIcon,
    this.onTap,
    this.textInputAction,
    this.keyboardType,
    this.minLines,
    this.maxLines,
    this.hintStyle,
    this.textStyle,
    this.borderSide,
    this.textInputFormatter,
    this.readOnly = false,
    this.counterStyle = false,
    this.counterText = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: textInputFormatter,
      readOnly: readOnly,
      style: textStyle,
      maxLines: maxLines,
      minLines: minLines,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onTap: onTap,
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      decoration: inputDecoration ??
          InputDecoration(
            counterStyle: counterStyle ? null : const TextStyle(
              height: double.minPositive,),
            counterText: counterText ? null : '',
            contentPadding: contentPadding ?? const EdgeInsets.all(10.0),
            hintText: hintText,
            hintStyle: hintStyle ??
                const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: AppTheme.gray30),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
            enabledBorder: OutlineInputBorder(
                borderSide: borderSide ?? const BorderSide(
                  color: AppTheme.gray40,
                  width: 1.0,
                )),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppTheme.orange,
                width: 1,
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppTheme.alert,
                width: 1,
              ),
            ),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
          ),
      onChanged: onChanged,
      onSaved: onSaved,
      onFieldSubmitted: onFieldSubmitted,
      autovalidateMode: autoValidateMode,
    );
  }
}

class MyTextFormFieldNoMaxLengthNoBorder extends StatelessWidget {
  // const MyTextFormField({Key? key}) : super(key: key);
  final EdgeInsetsGeometry? contentPadding;
  final String? hintText;
  final InputDecoration? inputDecoration;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final void Function(String?)? onFieldSubmitted;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSaved;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final AutovalidateMode? autoValidateMode;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final int? minLines;
  final int? maxLines;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final BorderSide? borderSide;
  final bool readOnly;
  final bool counterStyle;
  final bool counterText;
  final List<TextInputFormatter>? textInputFormatter;

  const MyTextFormFieldNoMaxLengthNoBorder({Key? key,
    this.hintText,
    this.inputDecoration,
    this.suffixIcon,
    this.obscureText = false,
    this.contentPadding,
    this.onFieldSubmitted,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.autoValidateMode,
    this.controller,
    this.prefixIcon,
    this.onTap,
    this.textInputAction,
    this.keyboardType,
    this.minLines,
    this.maxLines,
    this.hintStyle,
    this.textStyle,
    this.borderSide,
    this.textInputFormatter,
    this.readOnly = false,
    this.counterStyle = false,
    this.counterText = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: textInputFormatter,
      textAlignVertical: TextAlignVertical.center,
      textAlign: TextAlign.center,
      readOnly: readOnly,
      style: textStyle,
      maxLines: maxLines,
      minLines: minLines,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onTap: onTap,
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      decoration: inputDecoration ??
          InputDecoration(
            counterStyle: counterStyle ? null : const TextStyle(
              height: double.minPositive,),
            counterText: counterText ? null : '',
            contentPadding: contentPadding ?? const EdgeInsets.all(10.0),
            hintText: hintText,
            hintStyle: hintStyle ??
                const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: AppTheme.gray30),
            border: InputBorder.none,
            // enabledBorder: OutlineInputBorder(
            //     borderSide: borderSide ?? BorderSide(
            //       color: AppTheme.gray40,
            //       width: 1.0,
            //     )),
            // focusedBorder: const OutlineInputBorder(
            //   borderSide: BorderSide(
            //     color: AppTheme.orange,
            //     width: 1,
            //   ),
            // ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppTheme.alert,
                width: 1,
              ),
            ),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
          ),
      onChanged: onChanged,
      onSaved: onSaved,
      onFieldSubmitted: onFieldSubmitted,
      autovalidateMode: autoValidateMode,
    );
  }
}