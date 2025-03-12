import 'package:app/view/atom/button_atom.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app/view/atom/color_atom.dart';
import 'package:app/view/atom/text_style_atom.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldAtom extends StatefulWidget {
  final TextEditingController? controller;
  final EdgeInsetsGeometry? contentPadding;
  final bool enabled;
  final String? title;
  final String? subtitle;
  final String? hintText;
  final String? labelText;
  final String? helper;
  final Color? helperColor;
  final String? error;
  final bool withObscure;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final int maxLines;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final Function()? onTap;

  const TextFieldAtom({
    super.key,
    this.controller,
    this.contentPadding,
    this.enabled = true,
    this.title,
    this.subtitle,
    this.hintText,
    this.labelText,
    this.helper,
    this.helperColor = ColorAtom.bodyText,
    this.error,
    this.withObscure = false,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatters,
    this.textInputAction,
    this.maxLines = 1,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
  });

  @override
  State<TextFieldAtom> createState() => _TextFieldAtomState();
}

class _TextFieldAtomState extends State<TextFieldAtom> {
  bool _obscureText = false;

  final InputBorder borderNormal = OutlineInputBorder(
    borderSide: BorderSide(color: ColorAtom.disabled, width: 1.r),
    borderRadius: BorderRadius.circular(8.r),
  );

  final InputBorder borderError = OutlineInputBorder(
    borderSide: BorderSide(color: ColorAtom.red, width: 1.r),
    borderRadius: BorderRadius.circular(8.r),
  );

  Widget? _suffixIcon() {
    if (widget.withObscure || widget.suffixIcon != null) {
      return Padding(
        padding: REdgeInsets.symmetric(horizontal: 8),
        child: widget.withObscure
            ? ButtonAtom.icon(
                size: 24.r,
                color: ColorAtom.bodyText,
                onTap: () {
                  _obscureText = !_obscureText;
                  setState(() {});
                },
                icon: _obscureText ? IconsaxOutline.eye : IconsaxOutline.eye_slash,
              )
            : Icon(
                widget.suffixIcon,
                size: 24.r,
                color: ColorAtom.bodyText,
              ),
      );
    } else {
      return null;
    }
  }

  @override
  void initState() {
    _obscureText = widget.withObscure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if ((widget.title ?? '').isNotEmpty) ...[
          Text(
            widget.title!,
            style: TextStyleAtom.semiBold16,
          ),
          SizedBox(height: 8.r),
        ],
        if ((widget.subtitle ?? '').isNotEmpty) ...[
          Text(
            widget.subtitle!,
            style: TextStyleAtom.regular14BodyText,
          ),
          SizedBox(height: 8.r),
        ],
        TextField(
          enabled: widget.enabled,
          controller: widget.controller,
          obscureText: _obscureText,
          style: widget.enabled ? TextStyleAtom.regular14 : TextStyleAtom.regular14BodyText,
          cursorColor: ColorAtom.title,
          onChanged: widget.onChanged,
          onSubmitted: widget.onSubmitted,
          onTap: widget.onTap,
          readOnly: widget.onTap != null || !widget.enabled,
          inputFormatters: widget.inputFormatters,
          keyboardType: widget.keyboardType,
          textCapitalization: widget.textCapitalization,
          maxLines: widget.maxLines,
          textInputAction: widget.textInputAction,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyleAtom.regular14BodyText,
            labelText: widget.labelText,
            labelStyle: TextStyleAtom.regular14BodyText,
            alignLabelWithHint: true,
            floatingLabelStyle:
                (widget.error ?? '').isNotEmpty ? TextStyleAtom.regular16Red : TextStyleAtom.regular16BodyText,
            helperText: widget.helper,
            helperStyle: TextStyleAtom.semiBold12.copyWith(color: widget.helperColor),
            helperMaxLines: 4,
            errorText: (widget.error ?? '').isNotEmpty ? widget.error : null,
            errorStyle: TextStyleAtom.semiBold12Red,
            errorMaxLines: 4,
            isDense: true,
            contentPadding: widget.contentPadding ??
                REdgeInsets.only(
                  left: widget.prefixIcon == null ? 16 : 0,
                  right: widget.suffixIcon == null ? 16 : 0,
                  top: 12,
                  bottom: 12,
                ),
            constraints: const BoxConstraints(),
            prefixIcon: widget.prefixIcon != null
                ? Padding(
                    padding: REdgeInsets.symmetric(horizontal: 8),
                    child: Icon(
                      widget.prefixIcon,
                      size: 24.r,
                      color: ColorAtom.bodyText,
                    ),
                  )
                : null,
            prefixIconConstraints: const BoxConstraints(),
            suffixIcon: _suffixIcon(),
            suffixIconConstraints: const BoxConstraints(),
            fillColor: widget.enabled ? ColorAtom.transparent : ColorAtom.disabled40,
            filled: true,
            border: borderNormal,
            enabledBorder: borderNormal,
            focusedBorder: borderNormal,
            disabledBorder: borderNormal,
            errorBorder: borderError,
            focusedErrorBorder: borderError,
          ),
        ),
      ],
    );
  }
}
