import 'package:app/const/value_const.dart';
import 'package:app/controller/post_controller.dart';
import 'package:app/model/post_model.dart';
import 'package:app/view/atom/button_atom.dart';
import 'package:app/view/atom/color_atom.dart';
import 'package:app/view/atom/shadow_atom.dart';
import 'package:app/view/atom/text_style_atom.dart';
import 'package:app/view/page/post_detail_page.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PostMolecule extends StatelessWidget {
  final PostModel? data;
  const PostMolecule({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    PostController controller = Get.find();

    return Obx(() {
      final favorite = controller.postFavorites.any((e) => e.id == data?.id);
      
      return ButtonAtom.container(
        onTap: () => Get.to(() => PostDetailPage(data: data)),
        padding: REdgeInsets.all(16),
        color: ColorAtom.white,
        boxShadow: [ShadowAtom.card],
        border: Border.all(color: ColorAtom.stroke),
        borderRadius: BorderRadius.circular(10.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: REdgeInsets.only(top: 8),
                    child: Text(
                      data?.title ?? ValueConst.defaultValue,
                      style: TextStyleAtom.bold16,
                    ),
                  ),
                ),
                SizedBox(width: 4.r),
                ButtonAtom.icon(
                  icon: favorite ? IconsaxBold.heart : IconsaxOutline.heart,
                  color: favorite ? ColorAtom.red : ColorAtom.bodyText,
                  size: 24.r,
                  onTap: () => controller.addFavorite(data!.id!),
                ),
              ],
            ),
            SizedBox(height: 8.r),
            Text(
              data?.body ?? ValueConst.defaultValue,
              style: TextStyleAtom.regular14BodyText,
            ),
          ],
        ),
      );
    });
  }
}
