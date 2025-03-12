import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/model/menu_model.dart';
import 'package:app/view/atom/color_atom.dart';
import 'package:app/view/atom/text_style_atom.dart';

class TabAtom extends StatelessWidget {
  final TabController? controller;
  final List<MenuModel> tabs;
  final EdgeInsetsGeometry? margin;

  const TabAtom({
    super.key,
    this.controller,
    required this.tabs,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: const ShapeDecoration(
        color: ColorAtom.secondary,
        shape: StadiumBorder(),
      ),
      child: TabBar(
        controller: controller,
        labelColor: ColorAtom.white,
        labelStyle: TextStyleAtom.bold14,
        unselectedLabelColor: ColorAtom.bodyText,
        unselectedLabelStyle: TextStyleAtom.regular14,
        dividerHeight: 0,
        indicatorWeight: 0,
        padding: REdgeInsets.all(6),
        labelPadding: EdgeInsets.zero,
        indicatorPadding: EdgeInsets.zero,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: const ShapeDecoration(
          color: ColorAtom.primary,
          shape: StadiumBorder(),
        ),
        splashBorderRadius: BorderRadius.circular(40.r),
        tabs: List.generate(tabs.length, (index) {
          var item = tabs[index];
          return Padding(
            padding: REdgeInsets.all(8),
            child: Text(item.label),
          );
        }),
      ),
    );
  }
}
