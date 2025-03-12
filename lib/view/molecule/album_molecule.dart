import 'package:app/const/value_const.dart';
import 'package:app/controller/album_controller.dart';
import 'package:app/model/album_model.dart';
import 'package:app/view/atom/button_atom.dart';
import 'package:app/view/atom/color_atom.dart';
import 'package:app/view/atom/shadow_atom.dart';
import 'package:app/view/atom/text_style_atom.dart';
import 'package:app/view/page/album_detail_page.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AlbumMolecule extends StatelessWidget {
  final AlbumModel? data;
  const AlbumMolecule({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    AlbumController controller = Get.find();

    return Obx(() {
      final favorite = controller.albumFavorites.any((e) => e.id == data?.id);
      
      return ButtonAtom.container(
        onTap: () => Get.to(() => AlbumDetailPage(data: data)),
        padding: REdgeInsets.all(8),
        color: ColorAtom.white,
        boxShadow: [ShadowAtom.card],
        border: Border.all(color: ColorAtom.stroke),
        borderRadius: BorderRadius.circular(10.r),
        child: Column(
          children: [
            Text(
              data?.title ?? ValueConst.defaultValue,
              style: TextStyleAtom.semiBold16,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 2.r),
            ButtonAtom.icon(
              icon: favorite ? IconsaxBold.heart : IconsaxOutline.heart,
              color: favorite ? ColorAtom.red : ColorAtom.bodyText,
              size: 24.r,
              onTap: () => controller.addFavorite(data!.id!),
            ),
          ],
        ),
      );
    });
  }
}
