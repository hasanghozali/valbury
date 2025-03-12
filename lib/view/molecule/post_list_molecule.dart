import 'package:app/controller/post_controller.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/view/atom/loading_atom.dart';
import 'package:app/view/atom/scroll_expanded_atom.dart';
import 'package:app/view/atom/text_style_atom.dart';
import 'package:app/view/molecule/empty_molecule.dart';
import 'package:app/view/molecule/post_molecule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PostListMolecule extends StatelessWidget {
  final bool withTitle;
  const PostListMolecule({super.key, this.withTitle = false});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    PostController controller = Get.find();

    return RefreshIndicator(
      onRefresh: () => controller.fetchPosts(),
      child: Obx(() {
        final listData = (withTitle || controller.posts.isEmpty) ? controller.posts : controller.postFavorites;

        return ScrollExpandedAtom(
          padding: REdgeInsets.only(left: 20, right: 20, bottom: 20),
          isList: listData.isNotEmpty,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (withTitle) ...[
                Text(
                  s.posts,
                  style: TextStyleAtom.bold28,
                ),
                SizedBox(height: 16.r),
              ],
              LoadingAtom(
                isLoading: controller.isLoading,
                errorMessage: controller.errorMessage,
                onRetry: () => controller.fetchPosts(),
                child: listData.isNotEmpty
                    ? ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: listData.length,
                        separatorBuilder: (context, index) => SizedBox(height: 16.r),
                        itemBuilder: (context, index) => PostMolecule(data: listData[index]),
                      )
                    : Expanded(
                        child: EmptyMolecule(
                          title: s.no_post,
                          desc: s.no_post_desc,
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
