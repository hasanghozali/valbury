import 'package:app/controller/account_controller.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/view/atom/button_atom.dart';
import 'package:app/view/atom/color_atom.dart';
import 'package:app/view/atom/text_style_atom.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LanguageAtom extends StatelessWidget {
  const LanguageAtom({super.key});

  @override
  Widget build(BuildContext context) {
    final AccountController accountController = Get.find();
    final s = S.of(context);
    final locale = (Get.locale?.languageCode ?? 'en') == 'id' ? s.bahasa_indonesia : s.english;
    return ButtonAtom.container(
      onTap: () => accountController.changeLocale(),
      padding: REdgeInsets.symmetric(horizontal: 10, vertical: 6),
      color: ColorAtom.secondary,
      borderRadius: BorderRadius.circular(40.r),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            IconsaxOutline.translate,
            size: 14.r,
            color: ColorAtom.primary,
          ),
          SizedBox(width: 4.r),
          Text(
            locale,
            style: TextStyleAtom.regular12Primary,
          ),
        ],
      ),
    );
  }
}
