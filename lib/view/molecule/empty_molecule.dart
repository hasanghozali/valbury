import 'package:app/view/atom/text_style_atom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyMolecule extends StatelessWidget {
  final String title;
  final String? desc;
  final Widget? action;

  const EmptyMolecule({
    super.key,
    required this.title,
    this.desc,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
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
        ],
      ),
    );
  }
}
