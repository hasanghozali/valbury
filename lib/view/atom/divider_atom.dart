import 'package:app/view/atom/color_atom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DividerAtom extends StatelessWidget {
  const DividerAtom({
    super.key,
    this.thickness,
    this.height = 0,
  });

  final double? thickness;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: ColorAtom.stroke,
      thickness: thickness ?? 1.r,
      height: height,
    );
  }
}
