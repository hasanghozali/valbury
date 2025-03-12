import 'package:app/const/value_const.dart';
import 'package:app/controller/comment_controller.dart';
import 'package:app/controller/post_controller.dart';
import 'package:app/generated/l10n.dart';
import 'package:app/model/post_model.dart';
import 'package:app/view/atom/button_atom.dart';
import 'package:app/view/atom/color_atom.dart';
import 'package:app/view/atom/loading_atom.dart';
import 'package:app/view/atom/scaffold_atom.dart';
import 'package:app/view/atom/scroll_expanded_atom.dart';
import 'package:app/view/atom/text_style_atom.dart';
import 'package:app/view/molecule/comment_molecule.dart';
import 'package:app/view/molecule/empty_molecule.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PostDetailPage extends StatefulWidget {
  final PostModel? data;
  const PostDetailPage({super.key, this.data});

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  PostController postController = Get.find();
  final commentController = Get.put(CommentController());

  @override
  void initState() {
    super.initState();
    commentController.fetchComments(widget.data!.id!);
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return ScaffoldAtom(
      title: '',
      body: Obx(() {
        final favorite = postController.postFavorites.any((e) => e.id == widget.data?.id);

        return RefreshIndicator(
          onRefresh: () => commentController.fetchComments(widget.data!.id!),
          child: ScrollExpandedAtom(
            child: Column(
              children: [
                LoadingAtom(
                  isLoading: commentController.isLoading,
                  errorMessage: commentController.errorMessage,
                  onRetry: () => commentController.fetchComments(widget.data!.id!),
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: REdgeInsets.only(left: 20, right: 20, bottom: 20),
                          child: Column(
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
                                    onTap: () => postController.addFavorite(widget.data!.id!),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12.r),
                              Text(
                                widget.data?.body ?? ValueConst.defaultValue,
                                style: TextStyleAtom.regular16BodyText,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: REdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          child: Text(
                            s.comments,
                            style: TextStyleAtom.bold16,
                          ),
                        ),
                        SizedBox(
                          height: 160.r,
                          child: Obx(() {
                            if (commentController.comments.isEmpty) {
                              return Transform.scale(
                                scale: 0.7.r,
                                child: EmptyMolecule(
                                  title: s.no_comment,
                                  desc: s.no_comment_desc,
                                ),
                              );
                            }

                            return ListView.separated(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                              itemCount: commentController.comments.length,
                              separatorBuilder: (context, index) => SizedBox(width: 8.r),
                              padding: REdgeInsets.only(left: 20, right: 20, bottom: 20),
                              itemBuilder: (context, index) {
                                return CommentMolecule(data: commentController.comments[index]);
                              },
                            );
                          }),
                        ),
                      ],
                    ),
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
