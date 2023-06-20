import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../common/component/placeholders.dart';

class HomePlaceholder extends StatelessWidget {
  const HomePlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        CarouselPlaceholder(),
        SizedBox(
          height: 20,
        ),
        Shimmer.fromColors(
          child: ContentPlaceholder(
            lineType: ContentLineType.twoLines,
          ),
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
        ),
        SizedBox(
          height: 20,
        ),
        Shimmer.fromColors(
          child: BannerPlaceholder(),
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
        ),
        SizedBox(
          height: 20,
        ),
        Shimmer.fromColors(
          child: ContentPlaceholder(
            lineType: ContentLineType.threeLines,
          ),
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
        ),
        SizedBox(
          height: 20,
        ),
        Shimmer.fromColors(
          child: ContentPlaceholder(
            lineType: ContentLineType.twoLines,
          ),
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
        ),
        SizedBox(
          height: 20,
        ),
        Shimmer.fromColors(
          child: ContentPlaceholder(
            lineType: ContentLineType.threeLines,
          ),
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
        ),
        SizedBox(
          height: 20,
        ),
        Shimmer.fromColors(
          child: ContentPlaceholder(
            lineType: ContentLineType.twoLines,
          ),
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
        ),
        SizedBox(
          height: 20,
        ),
        Shimmer.fromColors(
          child: ContentPlaceholder(
            lineType: ContentLineType.threeLines,
          ),
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
