import 'dart:io';
import 'package:app/const/value_const.dart';
import 'package:app/view/atom/color_atom.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ImageAtom extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BoxBorder? border;
  final BorderRadiusGeometry borderRadius;

  const ImageAtom({
    super.key,
    this.url = '',
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.border,
    this.borderRadius = BorderRadius.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: border,
        borderRadius: borderRadius,
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: url.startsWith(ValueConst.schemeUrl) || url.isEmpty
            ? CachedNetworkImage(
                imageUrl: url,
                fit: fit,
                width: width,
                height: height,
                placeholder: (context, url) => Shimmer.fromColors(
                  highlightColor: ColorAtom.stroke,
                  baseColor: ColorAtom.paleGrey,
                  child: Container(
                    width: width,
                    height: height,
                    color: ColorAtom.disabled,
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  width: width,
                  height: height,
                  color: ColorAtom.paleGrey,
                  padding: REdgeInsets.all(10),
                  child: FractionallySizedBox(
                    widthFactor: 0.6.r,
                    heightFactor: 0.6.r,
                    child: const FittedBox(
                      child: Icon(
                        IconsaxOutline.gallery_slash,
                        color: ColorAtom.disabled,
                      ),
                    ),
                  ),
                ),
              )
            : Image.file(
                File(url),
                fit: fit,
                width: width,
                height: height,
              ),
      ),
    );
  }
}
