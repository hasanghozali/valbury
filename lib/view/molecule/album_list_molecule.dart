import 'package:app/controller/album_controller.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/view/atom/loading_atom.dart';
import 'package:app/view/atom/scroll_expanded_atom.dart';
import 'package:app/view/atom/text_style_atom.dart';
import 'package:app/view/molecule/album_molecule.dart';
import 'package:app/view/molecule/empty_molecule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class AlbumListMolecule extends StatelessWidget {
  final bool withTitle;
  const AlbumListMolecule({super.key, this.withTitle = false});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    AlbumController controller = Get.find();

    return RefreshIndicator(
      onRefresh: () => controller.fetchAlbums(),
      child: Obx(() {
        final listData = (withTitle || controller.albums.isEmpty) ? controller.albums : controller.albumFavorites;

        return ScrollExpandedAtom(
          padding: REdgeInsets.only(left: 20, right: 20, bottom: 20),
          isList: listData.isNotEmpty,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (withTitle) ...[
                Text(
                  s.albums,
                  style: TextStyleAtom.bold28,
                ),
                SizedBox(height: 16.r),
              ],
              LoadingAtom(
                isLoading: controller.isLoading,
                errorMessage: controller.errorMessage,
                onRetry: () => controller.fetchAlbums(),
                child: listData.isNotEmpty
                    ? MasonryGridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: listData.length,
                        crossAxisCount: 2,
                        mainAxisSpacing: 8.r,
                        crossAxisSpacing: 8.r,
                        itemBuilder: (context, index) => AlbumMolecule(data: listData[index]),
                      )
                    : Expanded(
                        child: EmptyMolecule(
                          title: s.no_album,
                          desc: s.no_album_desc,
                        ),
                      ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
