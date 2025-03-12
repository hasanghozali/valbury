import 'package:app/view/atom/color_atom.dart';
import 'package:app/view/atom/text_style_atom.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SnackBarAtom {
  static _base({
    required String title,
    required IconData icon,
    required Color color,
  }) {
    Get.rawSnackbar(
      message: '',
      messageText: Text(
        title,
        style: TextStyleAtom.semiBold14White,
      ),
      icon: Icon(
        icon,
        size: 24.r,
        color: ColorAtom.white,
      ),
      shouldIconPulse: false,
      padding: REdgeInsets.all(12),
      backgroundColor: color,
      borderRadius: 8.r,
      margin: REdgeInsets.only(left: 20, right: 20, bottom: 20),
      snackPosition: SnackPosition.TOP,
    );
  }

  static red(String title) {
    _base(
      title: title,
      icon: IconsaxOutline.close_circle,
      color: ColorAtom.red,
    );
  }

  static yellow(String title) {
    _base(
      title: title,
      icon: IconsaxOutline.warning_2,
      color: ColorAtom.yellow,
    );
  }

  static green(String title) {
    _base(
      title: title,
      icon: IconsaxOutline.tick_circle,
      color: ColorAtom.green,
    );
  }
}
