import 'package:app/const/value_const.dart';
import 'package:app/controller/album_controller.dart';
import 'package:app/controller/photo_controller.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/model/album_model.dart';
import 'package:app/view/atom/button_atom.dart';
import 'package:app/view/atom/color_atom.dart';
import 'package:app/view/atom/loading_atom.dart';
import 'package:app/view/atom/scaffold_atom.dart';
import 'package:app/view/atom/scroll_expanded_atom.dart';
import 'package:app/view/atom/text_style_atom.dart';
import 'package:app/view/molecule/empty_molecule.dart';
import 'package:app/view/molecule/photo_molecule.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class AlbumDetailPage extends StatefulWidget {
  final AlbumModel? data;
  const AlbumDetailPage({super.key, this.data});

  @override
  State<AlbumDetailPage> createState() => _AlbumDetailPageState();
}

class _AlbumDetailPageState extends State<AlbumDetailPage> {
  AlbumController albumController = Get.find();
  final photoController = Get.put(PhotoController());

  @override
  void initState() {
    super.initState();
    photoController.fetchPhotos(widget.data!.id!);
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return ScaffoldAtom(
      title: '',
      body: Obx(() {
        final favorite = albumController.albumFavorites.any((e) => e.id == widget.data?.id);

        return RefreshIndicator(
          onRefresh: () => photoController.fetchPhotos(widget.data!.id!),
          child: ScrollExpandedAtom(
            isList: photoController.photos.isNotEmpty,
            padding: REdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Column(
              children: [
                LoadingAtom(
                  isLoading: photoController.isLoading,
                  errorMessage: photoController.errorMessage,
                  onRetry: () => photoController.fetchPhotos(widget.data!.id!),
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
                                widget.data?.title ?? ValueConst.defaultValue,
                                style: TextStyleAtom.bold20,
                              ),
                            ),
                          ),
                          SizedBox(width: 4.r),
                          ButtonAtom.icon(
                            icon: favorite ? IconsaxBold.heart : IconsaxOutline.heart,
                            color: favorite ? ColorAtom.red : ColorAtom.bodyText,
                            size: 24.r,
                            onTap: () => albumController.addFavorite(widget.data!.id!),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.r),
                      photoController.photos.isNotEmpty
                          ? MasonryGridView.count(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: photoController.photos.length,
                              crossAxisCount: 2,
                              mainAxisSpacing: 8.r,
                              crossAxisSpacing: 8.r,
                              itemBuilder: (context, index) => PhotoMolecule(data: photoController.photos[index]),
                            )
                          : EmptyMolecule(
                              title: s.no_photo,
                              desc: s.no_photo_desc,
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
