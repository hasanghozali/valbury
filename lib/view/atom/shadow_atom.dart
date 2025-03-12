import 'package:app/view/atom/color_atom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShadowAtom {
  static final drop = BoxShadow(
    offset: Offset(4.r, 4.r),
    blurRadius: 10.r,
    spreadRadius: 0,
    color: ColorAtom.black3,
  );

  static final bottomBar = BoxShadow(
    offset: Offset(0, -6.r),
    blurRadius: 10.r,
    spreadRadius: 0,
    color: ColorAtom.black3,
  );

  static final card = BoxShadow(
    offset: Offset(4.r, 4.r),
    blurRadius: 15.r,
    spreadRadius: 0,
    color: ColorAtom.black3,
  );
}
