import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

Shimmer loadingWidget(Size size) {
  return Shimmer.fromColors(
      baseColor: Colors.grey.shade400.withOpacity(0.5),
      highlightColor: Colors.grey.shade200.withOpacity(0.5),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(14)),
        height: size.height * 0.07,
        // width: 20,
      ));
}
