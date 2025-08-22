import 'package:double_partners/config/theme/app_dimensions.dart';
import 'package:double_partners/share/helpers/custom_grid_row_size.dart';
import 'package:flutter/material.dart';

class CustomSliverGrid extends StatelessWidget {
  final ScrollController scrollController;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final List<Widget> children;
  final double childAspectRatio;
  final ScrollPhysics scrollPhysics;
  final bool shrinkWrap;

  const CustomSliverGrid({
    super.key,
    required this.scrollController,
    required this.children,
    required this.scrollPhysics,
    this.crossAxisSpacing = kSize16,
    this.childAspectRatio = 1,
    this.shrinkWrap = false,
    this.mainAxisSpacing = kSize16,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      physics: scrollPhysics,
      shrinkWrap: shrinkWrap,
      slivers: [
        SliverGrid.count(
          crossAxisSpacing: crossAxisSpacing,
          crossAxisCount: CustomGridRowSize.byDefault(context),
          mainAxisSpacing: mainAxisSpacing,
          childAspectRatio: childAspectRatio,
          children: children,
        ),
      ],
    );
  }
}
