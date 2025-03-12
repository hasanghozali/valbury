import 'package:app/const/value_const.dart';
import 'package:app/model/photo_model.dart';
import 'package:app/view/atom/button_atom.dart';
import 'package:app/view/atom/color_atom.dart';
import 'package:app/view/atom/image_atom.dart';
import 'package:app/view/atom/shadow_atom.dart';
import 'package:app/view/atom/text_style_atom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhotoMolecule extends StatelessWidget {
  final PhotoModel? data;
  const PhotoMolecule({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final size = (MediaQuery.of(context).size.width / 2) - 24.r;
    
    return ButtonAtom.container(
      color: ColorAtom.white,
      boxShadow: [ShadowAtom.card],
      border: Border.all(color: ColorAtom.stroke),
      borderRadius: BorderRadius.circular(10.r),
      child: Column(
        children: [
          ImageAtom(
            width: size,
            height: size,
            fit: BoxFit.cover,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r), topRight: Radius.circular(10.r)),
            url: data?.thumbnailUrl ?? '',
          ),
          Padding(
            padding: REdgeInsets.all(8),
            child: Text(
              data?.title ?? ValueConst.defaultValue,
              style: TextStyleAtom.semiBold14,
            ),
          ),
        ],
      ),
    );
  }
}
