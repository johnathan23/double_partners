import 'package:double_partners/config/theme/app_dimensions.dart';
import 'package:double_partners/share/helpers/custom_grid_row_size.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SliverGridShimmer extends StatelessWidget {
  const SliverGridShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: CustomGridRowSize.byDefault(context),
        crossAxisSpacing: kSize16,
        mainAxisSpacing: kSize16,
        mainAxisExtent: kSize150,
      ),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kSize12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: kSize90,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: const BorderRadius.vertical(top: Radius.circular(kSize12))),
                ),
                const SizedBox(height: kSize10),
                Container(height: kSize16, margin: kPaddingSymmetric(horizontal: kSize8), color: Colors.white),
                const SizedBox(height: kSize8),
                Container(height: kSize16, margin: kPaddingSymmetric(horizontal: kSize8), width: kSize80, color: Colors.white),
              ],
            ),
          ),
        );
      },
    );
  }
}
