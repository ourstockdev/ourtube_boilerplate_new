import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ourtube_boilerplate/app/resources/colors/colors.dart';
import 'package:ourtube_boilerplate/app/resources/dimensions/inset.dart';
import 'package:ourtube_boilerplate/app/resources/strings/font.dart';
import 'package:ourtube_boilerplate/ui/common/components/forms/app_input_decoration.dart';
import 'package:ourtube_boilerplate/ui/common/widgets/aligns/alignments.dart';

class FormFieldMessages {
  String? error;
  String? success;
}

class AppTextFormField extends TextFormField {
  AppTextFormField({
    Key? key,
    FocusNode? focusNode,
    required TextEditingController? controller,
    required void Function(String) onChanged,
    String? Function(String?)? validator,
    VoidCallback? onEditingComplete,
    void Function(String)? onFieldSubmitted,
    TextStyle? style,
    InputDecoration? decoration,
    List<TextInputFormatter>? inputFormatters,
    TextInputAction? textInputAction,
    TextInputType? keyboardType,
    bool obscureText = false,
    bool enabled = true,
  }) : super(
          key: key,
          focusNode: focusNode,
          controller: controller,
          onChanged: onChanged,
          validator: validator,
          style: style,
          decoration: decoration,
          inputFormatters: inputFormatters,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          obscureText: obscureText,
          enabled: enabled,
          onEditingComplete: onEditingComplete,
          onFieldSubmitted: onFieldSubmitted,
        );

  static Widget password({
    Key? key,
    FocusNode? focusNode,
    required final TextEditingController? controller,
    required final void Function(bool) onToggleVisible,
    required final void Function(String) onChanged,
    String? Function(String?)? validator,
    required bool visible,
    final VoidCallback? onEditingComplete,
    final void Function(String)? onFieldSubmitted,
    final String? hintText,
    final String? errorText,
    final String? successText,
    final TextInputAction? textInputAction,
    final TextInputType? keyboardType,
  }) {
    // MaterialButton
    return Stack(
      children: [
        AppTextFormField.normal(
          key: key,
          focusNode: focusNode,
          controller: controller,
          onChanged: onChanged,
          validator: validator,
          hintText: hintText,
          errorText: errorText,
          successText: successText,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          obscureText: !visible,
          onEditingComplete: onEditingComplete,
          onFieldSubmitted: onFieldSubmitted,
        ),
        CenterRight(
          child: GestureDetector(
            onTap: () => onToggleVisible(!visible),
            child: Padding(
              padding: AppInset.all12,
              child: SvgPicture.asset(
                visible
                    ? 'assets/icons/visible.svg'
                    : 'assets/icons/invisible.svg',
                width: 24,
                height: 24,
              ),
            ),
          ),
        ),
      ],
    );
  }

  static Widget timer({
    Key? key,
    FocusNode? focusNode,
    required TextEditingController? controller,
    required void Function(String) onChanged,
    String? Function(String?)? validator,
    required String timer,
    VoidCallback? onEditingComplete,
    void Function(String)? onFieldSubmitted,
    String? hintText,
    String? errorText,
    String? successText,
    List<TextInputFormatter>? inputFormatters,
    TextInputAction? textInputAction,
    TextInputType? keyboardType,
    bool enabled = true,
  }) =>
      Stack(
        children: [
          AppTextFormField.normal(
            key: key,
            focusNode: focusNode,
            controller: controller,
            onChanged: onChanged,
            validator: validator,
            hintText: hintText,
            errorText: errorText,
            successText: successText,
            inputFormatters: inputFormatters,
            textInputAction: textInputAction,
            keyboardType: keyboardType,
            onEditingComplete: onEditingComplete,
            onFieldSubmitted: onFieldSubmitted,
            enabled: enabled,
          ),
          CenterRight(
            child: Padding(
              padding: AppInset.all12,
              child: Text(
                timer,
                style:
                    AppTextStyle.title3R1418.copyWith(color: AppColor.blue300),
              ),
            ),
          ),
        ],
      );

  factory AppTextFormField.normal({
    Key? key,
    FocusNode? focusNode,
    required TextEditingController? controller,
    required void Function(String) onChanged,
    String? Function(String?)? validator,
    VoidCallback? onEditingComplete,
    void Function(String)? onFieldSubmitted,
    String? hintText,
    String? errorText,
    String? successText,
    List<TextInputFormatter>? inputFormatters,
    TextInputAction? textInputAction,
    TextInputType? keyboardType,
    bool obscureText = false,
    bool enabled = true,
  }) =>
      AppTextFormField(
        key: key,
        focusNode: focusNode,
        controller: controller,
        onChanged: onChanged,
        validator: validator,
        enabled: enabled,
        style: AppTextStyle.title1R1618.copyWith(color: AppColor.bk),
        decoration: AppInputDecoration.create(
          hintText: hintText,
          errorText: errorText,
          successText: successText,
        ),
        inputFormatters: inputFormatters,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        obscureText: obscureText,
        onEditingComplete: onEditingComplete,
        onFieldSubmitted: onFieldSubmitted,
      );

  static Widget loading({
    Key? key,
    FocusNode? focusNode,
    required TextEditingController? controller,
    required void Function(String) onChanged,
    String? Function(String?)? validator,
    VoidCallback? onEditingComplete,
    void Function(String)? onFieldSubmitted,
    String? hintText,
    String? errorText,
    String? successText,
    List<TextInputFormatter>? inputFormatters,
    TextInputAction? textInputAction,
    TextInputType? keyboardType,
    bool obscureText = false,
    bool loading = false,
  }) =>
      Stack(
        children: [
          AppTextFormField.normal(
            key: key,
            focusNode: focusNode,
            controller: controller,
            onChanged: onChanged,
            validator: validator,
            hintText: hintText,
            errorText: errorText,
            successText: successText,
            inputFormatters: inputFormatters,
            textInputAction: textInputAction,
            keyboardType: keyboardType,
            onEditingComplete: onEditingComplete,
            onFieldSubmitted: onFieldSubmitted,
            obscureText: obscureText,
          ),
          CenterRight(
            child: Opacity(
              opacity: loading ? 1 : 0,
              child: Container(
                width: 16,
                height: 16,
                margin: const EdgeInsets.only(top: 16, right: 16),
                child: const CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          ),
        ],
      );

  static Widget arrowDown({
    Key? key,
    FocusNode? focusNode,
    TextEditingController? controller,
    String? hintText,
    VoidCallback? onPressArrow,
    TextStyle? style,
  }) =>
      Stack(
        children: [
          AppTextFormField(
            key: key,
            focusNode: focusNode,
            onChanged: (_) {},
            controller: controller,
            decoration: AppInputDecoration.disabled(text: hintText),
            enabled: false,
            style:
                style ?? AppTextStyle.title1R1618.copyWith(color: AppColor.bk),
          ),
          CenterRight(
            child: GestureDetector(
              onTap: onPressArrow,
              child: Padding(
                padding: AppInset.all12,
                child: SvgPicture.asset(
                  'assets/icons/option_arrow.svg',
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ),
        ],
      );

  factory AppTextFormField.disabled({
    Key? key,
    FocusNode? focusNode,
    String? text,
    TextStyle? style,
  }) =>
      AppTextFormField(
        key: key,
        focusNode: focusNode,
        onChanged: (_) {},
        controller: null,
        decoration: AppInputDecoration.disabled(text: text),
        enabled: false,
        style: style ?? AppTextStyle.title1R1618.copyWith(color: AppColor.bk),
      );
}
