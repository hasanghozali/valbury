import 'package:app/const/value_const.dart';
import 'package:app/view/atom/color_atom.dart';
import 'package:flutter/material.dart';

class TextStyleAtom {
  static const _defaultColor = ColorAtom.title;
  static const _defaultFont = ValueConst.fontFamily;

  //Regular
  static const _regular = TextStyle(
    fontFamily: _defaultFont,
    fontWeight: FontWeight.w400,
    color: _defaultColor,
    letterSpacing: 0.25,
  );

  static final regular12 = _regular.copyWith(fontSize: 12);
  static final regular12Primary = regular12.copyWith(color: ColorAtom.primary);
  static final regular12BodyText = regular12.copyWith(color: ColorAtom.bodyText);

  static final regular14 = _regular.copyWith(fontSize: 14);
  static final regular14Primary = regular14.copyWith(color: ColorAtom.primary);
  static final regular14BodyText = regular14.copyWith(color: ColorAtom.bodyText);

  static final regular16 = _regular.copyWith(fontSize: 16);
  static final regular16BodyText = regular16.copyWith(color: ColorAtom.bodyText);
  static final regular16Red = regular16.copyWith(color: ColorAtom.red);

  static final regular18 = _regular.copyWith(fontSize: 18);

  //Semi Bold
  static const _semiBold = TextStyle(
    fontFamily: _defaultFont,
    fontWeight: FontWeight.w600,
    color: _defaultColor,
    letterSpacing: 0.25,
  );

  static final semiBold12 = _semiBold.copyWith(fontSize: 12);
  static final semiBold12Red = semiBold12.copyWith(color: ColorAtom.red);

  static final semiBold14 = _semiBold.copyWith(fontSize: 14);
  static final semiBold14Primary = semiBold14.copyWith(color: ColorAtom.primary);
  static final semiBold14White= semiBold14.copyWith(color: ColorAtom.white);

  static final semiBold16 = _semiBold.copyWith(fontSize: 16);

  //Bold
  static const _bold = TextStyle(
    fontFamily: _defaultFont,
    fontWeight: FontWeight.w700,
    color: _defaultColor,
    letterSpacing: 0.25,
  );

  static final bold12 = _bold.copyWith(fontSize: 12);

  static final bold14 = _bold.copyWith(fontSize: 14);

  static final bold16 = _bold.copyWith(fontSize: 16);

  static final bold18 = _bold.copyWith(fontSize: 18);

  static final bold20 = _bold.copyWith(fontSize: 20);
  static final bold20Primary = bold20.copyWith(color: ColorAtom.primary);

  static final bold24 = _bold.copyWith(fontSize: 24);

  static final bold28 = _bold.copyWith(fontSize: 28);
}
