import 'package:app/generated/l10n.dart';
import 'package:app/view/atom/button_atom.dart';
import 'package:app/view/atom/color_atom.dart';
import 'package:app/view/atom/text_style_atom.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorMolecule extends StatelessWidget {
  final String? desc;
  final void Function()? onTap;

  const ErrorMolecule({
    super.key,
    this.desc,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            IconsaxOutline.info_circle,
            size: 60.r,
            color: ColorAtom.red,
          ),
          SizedBox(height: 16.r),
          Text(
            s.error_title,
            style: TextStyleAtom.bold24,
            textAlign: TextAlign.center,
          ),
          if ((desc ?? '').isNotEmpty) ...[
            SizedBox(height: 4.r),
            Text(
              desc!,
              style: TextStyleAtom.regular14BodyText,
              textAlign: TextAlign.center,
            ),
          ],
          SizedBox(height: 16.r),
          ButtonAtom.primary(
            width: 120.r,
            label: s.retry,
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
