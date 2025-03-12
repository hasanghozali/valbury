import 'package:app/view/atom/color_atom.dart';
import 'package:app/view/atom/text_style_atom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonAtom {
  static Widget _filled({
    final double? width,
    final double? height,
    final double horizontalPadding = 12,
    final String? label,
    final TextStyle? labelStyle,
    final IconData? icon,
    final double? iconSize,
    final IconAlignment? iconAlignment,
    final Color? backgroundColor,
    final Color? disableColor,
    final Color? childColor,
    final BorderSide? side,
    final void Function()? onTap,
  }) {
    final color = onTap == null ? ColorAtom.bodyText : childColor;

    final textStyle = labelStyle?.copyWith(color: color) ?? TextStyleAtom.bold16.copyWith(color: color);

    final buttonStyle = FilledButton.styleFrom(
      padding: width == null ? REdgeInsets.symmetric(horizontal: horizontalPadding) : EdgeInsets.zero,
      backgroundColor: backgroundColor,
      foregroundColor: color,
      disabledBackgroundColor: disableColor ?? ColorAtom.disabled,
      shape: const StadiumBorder(),
      side: side,
    );

    return SizedBox(
      width: width,
      height: height ?? 48.r,
      child: label != null
          ? FilledButton.icon(
              onPressed: onTap,
              label: Text(label, style: textStyle),
              iconAlignment: iconAlignment ?? IconAlignment.end,
              icon: icon != null ? Icon(icon, size: iconSize ?? 24.r, color: color) : null,
              style: buttonStyle)
          : FilledButton(
              onPressed: onTap,
              iconAlignment: iconAlignment ?? IconAlignment.end,
              style: buttonStyle,
              child: Icon(icon, size: iconSize ?? 24.r, color: color),
            ),
    );
  }

  static Widget primary({
    final double? width,
    final String? label,
    final IconData? icon,
    final IconAlignment? iconAlignment,
    final void Function()? onTap,
  }) {
    return _filled(
      width: width,
      label: label,
      icon: icon,
      iconAlignment: iconAlignment,
      onTap: onTap,
      backgroundColor: ColorAtom.primary,
      childColor: ColorAtom.white,
    );
  }

  static Widget secondary({
    final double? width,
    final double? height,
    final String? label,
    final IconData? icon,
    final IconAlignment? iconAlignment,
    final void Function()? onTap,
  }) {
    return _filled(
      width: width,
      height: height,
      label: label,
      icon: icon,
      iconAlignment: iconAlignment,
      onTap: onTap,
      backgroundColor: ColorAtom.secondary,
      childColor: ColorAtom.primary,
    );
  }

  static Widget link({
    final double? width,
    final String? label,
    final IconData? icon,
    final IconAlignment? iconAlignment,
    final void Function()? onTap,
    final Color? childColor = ColorAtom.primary,
  }) {
    return _filled(
      width: width,
      height: 30.r,
      horizontalPadding: 8,
      label: label,
      labelStyle: TextStyleAtom.bold14,
      icon: icon,
      iconSize: 20.r,
      iconAlignment: iconAlignment,
      onTap: onTap,
      backgroundColor: ColorAtom.transparent,
      childColor: childColor,
      disableColor: ColorAtom.transparent,
    );
  }

  static Widget icon({
    final IconData? icon,
    final String? sourceIcon,
    final double? size,
    final Color? color,
    final void Function()? onTap,
  }) {
    final iconSize = size ?? 24.r;
    return IconButton(
      onPressed: onTap,
      icon: sourceIcon != null
          ? SvgPicture.asset(
              sourceIcon,
              width: iconSize,
              height: iconSize,
            )
          : Icon(icon),
      iconSize: iconSize,
      color: color,
      disabledColor: ColorAtom.disabled,
      constraints: const BoxConstraints(),
      style: const ButtonStyle(tapTargetSize: MaterialTapTargetSize.shrinkWrap),
    );
  }

  static Widget container({
    final void Function()? onTap,
    final double? width,
    final double? height,
    final EdgeInsetsGeometry padding = EdgeInsets.zero,
    final EdgeInsetsGeometry? margin,
    final AlignmentGeometry? alignment,
    final BoxConstraints? constraints,
    final Color? color,
    final BoxBorder? border,
    final BorderRadius? borderRadius,
    List<BoxShadow>? boxShadow,
    final Widget? child,
  }) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      alignment: alignment,
      constraints: constraints,
      decoration: BoxDecoration(
        color: color,
        border: border,
        borderRadius: borderRadius,
        boxShadow: boxShadow,
      ),
      child: Material(
        color: ColorAtom.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: borderRadius,
          child: Padding(
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }
}
