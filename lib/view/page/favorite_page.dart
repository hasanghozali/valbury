import 'package:app/generated/l10n.dart';
import 'package:app/model/menu_model.dart';
import 'package:app/view/atom/tab_atom.dart';
import 'package:app/view/atom/text_style_atom.dart';
import 'package:app/view/molecule/album_list_molecule.dart';
import 'package:app/view/molecule/post_list_molecule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final _listMenu = [
    MenuModel(
      label: S().posts,
      child: const PostListMolecule(),
    ),
    MenuModel(
      label: S().albums,
      child: const AlbumListMolecule(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Text(
            s.favorites,
            style: TextStyleAtom.bold28,
          ),
          SizedBox(height: 16.r),
          TabAtom(
            margin: REdgeInsets.symmetric(horizontal: 20),
            tabs: _listMenu,
          ),
          SizedBox(height: 16.r),
          Expanded(
            child: TabBarView(
              children: _listMenu.map((e) => e.child ?? const SizedBox()).toList(),
            ),
          )
        ],
      ),
    );
  }
}
