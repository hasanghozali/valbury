import 'package:flutter/material.dart';

class ScrollExpandedAtom extends StatelessWidget {
  final ScrollPhysics physics;
  final EdgeInsetsGeometry padding;
  final ScrollController? controller;
  final bool isList;
  final Widget child;

  const ScrollExpandedAtom({
    super.key,
    this.physics = const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
    this.padding = EdgeInsets.zero,
    this.controller,
    this.isList = false,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) => SingleChildScrollView(
        controller: controller,
        physics: physics,
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: isList
              ? Padding(
                  padding: padding,
                  child: SafeArea(child: child),
                )
              : IntrinsicHeight(
                  child: Padding(
                    padding: padding,
                    child: SafeArea(child: child),
                  ),
                ),
        ),
      ),
    );
  }
}
