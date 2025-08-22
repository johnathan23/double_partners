import 'package:double_partners/config/theme/app_dimensions.dart';
import 'package:double_partners/share/helpers/custom_grid_row_size.dart';
import 'package:flutter/material.dart';

class CustomSliverGridFixedCrossAxisCount extends StatelessWidget {
  final ScrollController scrollController;
  final int? itemCount;
  final double mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;
  final double crossAxisSpacing;
  final double mainAxisSpacing;

  const CustomSliverGridFixedCrossAxisCount({
    super.key,
    required this.scrollController,
    required this.itemCount,
    required this.mainAxisExtent,
    required this.itemBuilder,
    this.crossAxisSpacing = kSize16,
    this.mainAxisSpacing = kSize16,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverGrid.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: CustomGridRowSize.byDefault(context),
            crossAxisSpacing: crossAxisSpacing,
            mainAxisSpacing: mainAxisSpacing,
            mainAxisExtent: mainAxisExtent,
          ),
          itemCount: itemCount,
          itemBuilder: itemBuilder,
        ),
      ],
    );
  }
}
