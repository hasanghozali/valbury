import 'package:app/const/value_const.dart';
import 'package:app/model/comment_model.dart';
import 'package:app/view/atom/button_atom.dart';
import 'package:app/view/atom/color_atom.dart';
import 'package:app/view/atom/shadow_atom.dart';
import 'package:app/view/atom/text_style_atom.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentMolecule extends StatelessWidget {
  final CommentModel? data;
  const CommentMolecule({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return ButtonAtom.container(
      padding: REdgeInsets.symmetric(horizontal: 12, vertical: 8),
      width: MediaQuery.of(context).size.width - 40.r,
      color: ColorAtom.white,
      boxShadow: [ShadowAtom.card],
      border: Border.all(color: ColorAtom.stroke),
      borderRadius: BorderRadius.circular(10.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                IconsaxBold.profile_circle,
                size: 24.r,
                color: ColorAtom.primary,
              ),
              SizedBox(width: 4.r),
              Expanded(
                child: Text(
                  data?.name ?? ValueConst.defaultValue,
                  style: TextStyleAtom.semiBold14,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: 4.r),
          Text(
            data?.email ?? ValueConst.defaultValue,
            style: TextStyleAtom.regular12Primary,
          ),
          SizedBox(height: 8.r),
          Expanded(
            child: Text(
              data?.body ?? ValueConst.defaultValue,
              style: TextStyleAtom.regular12BodyText,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
