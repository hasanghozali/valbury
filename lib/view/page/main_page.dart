import 'package:app/const/icon_const.dart';
import 'package:app/controller/account_controller.dart';
import 'package:app/controller/album_controller.dart';
import 'package:app/controller/post_controller.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/model/menu_model.dart';
import 'package:app/view/atom/button_atom.dart';
import 'package:app/view/atom/color_atom.dart';
import 'package:app/view/atom/image_atom.dart';
import 'package:app/view/atom/scaffold_atom.dart';
import 'package:app/view/atom/text_style_atom.dart';
import 'package:app/view/molecule/album_list_molecule.dart';
import 'package:app/view/molecule/post_list_molecule.dart';
import 'package:app/view/page/favorite_page.dart';
import 'package:app/view/page/account_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;
  final _listMenu = [
    MenuModel(
      label: S().posts,
      iconAsset: IconConst.icPost,
      iconAssetActive: IconConst.icPostActive,
      child: const PostListMolecule(withTitle: true),
    ),
    MenuModel(
      label: S().albums,
      iconAsset: IconConst.icGallery,
      iconAssetActive: IconConst.icGalleryActive,
      child: const AlbumListMolecule(withTitle: true),
    ),
    MenuModel(
      label: S().favorites,
      iconAsset: IconConst.icFavorite,
      iconAssetActive: IconConst.icFavoriteActive,
      child: const FavoritePage(),
    ),
  ];

  final AccountController accountController = Get.find();
  final postController = Get.put(PostController());
  final albumController = Get.put(AlbumController());

  @override
  void initState() {
    super.initState();
    postController.fetchPosts();
    albumController.fetchAlbums();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return ScaffoldAtom(
      appBarSpace: Padding(
        padding: REdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: s.hello,
                      style: TextStyleAtom.regular18,
                    ),
                    TextSpan(
                      text: accountController.account.value?.name ?? '',
                      style: TextStyleAtom.bold18,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 8.r),
            ButtonAtom.container(
              onTap: () => Get.to(() => const AccountPage()),
              borderRadius: BorderRadius.circular(40.r),
              child: ImageAtom(
                width: 40.r,
                height: 40.r,
                borderRadius: BorderRadius.circular(40.r),
                url: accountController.account.value?.avatar ?? '',
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: ColorAtom.stroke, width: 1.r)),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: ColorAtom.white,
          elevation: 0,
          iconSize: 24.r,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: TextStyleAtom.bold12,
          unselectedLabelStyle: TextStyleAtom.regular12,
          selectedItemColor: ColorAtom.primary,
          unselectedItemColor: ColorAtom.bodyText,
          items: _listMenu
              .map((e) => BottomNavigationBarItem(
                    icon: SvgPicture.asset(e.iconAsset ?? ''),
                    activeIcon: SvgPicture.asset(e.iconAssetActive ?? ''),
                    label: e.label,
                  ))
              .toList(),
          currentIndex: _index,
          onTap: (value) {
            _index = value;
            setState(() {});
          },
        ),
      ),
      body: _listMenu.elementAt(_index).child ?? const SizedBox(),
    );
  }
}
