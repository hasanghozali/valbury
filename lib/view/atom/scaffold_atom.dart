import 'package:app/view/atom/button_atom.dart';
import 'package:app/view/atom/color_atom.dart';
import 'package:app/view/atom/text_style_atom.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ScaffoldAtom extends StatelessWidget {
  final String? title;
  final bool showLeading;
  final bool showShadow;
  final List<Widget>? actions;
  final Widget body;
  final Widget? appBarSpace;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Color? appBarBackgroundColor;

  const ScaffoldAtom({
    super.key,
    this.title,
    this.showLeading = true,
    this.showShadow = true,
    this.actions,
    required this.body,
    this.appBarSpace,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.floatingActionButtonLocation,
    this.appBarBackgroundColor = ColorAtom.white,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorAtom.white,
      appBar: appBarSpace != null
          ? AppBar(
              flexibleSpace: SafeArea(child: appBarSpace!),
              automaticallyImplyLeading: false,
              scrolledUnderElevation: 0,
              backgroundColor: ColorAtom.white,
            )
          : (title == null
              ? null
              : AppBar(
                  title: Text(
                    title ?? '',
                    style: TextStyleAtom.bold18,
                  ),
                  scrolledUnderElevation: 0,
                  backgroundColor: ColorAtom.white,
                  actions: [...?actions, SizedBox(width: 12.r)],
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  leading: showLeading
                      ? ButtonAtom.icon(
                          icon: IconsaxOutline.arrow_left,
                          size: 24.r,
                          color: ColorAtom.primary,
                          onTap: () => Get.back(),
                        )
                      : null,
                )),
      body: title == null ? SafeArea(bottom: false, child: body) : body,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
