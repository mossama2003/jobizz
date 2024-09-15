import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../style/app_colors.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      enabled: false,
      baseColor: AppColors.shimmerLoading,
      highlightColor: AppColors.shimmerLoading.withOpacity(0.001),
      child: child,
    );
  }
}

class CustomShimmerCard extends StatelessWidget {
  const CustomShimmerCard({
    super.key,
    required this.width,
    required this.height,
    required this.radius,
  });

  final double width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: AppColors.shimmerLoading.withOpacity(.5),
      ),
    );
  }
}
