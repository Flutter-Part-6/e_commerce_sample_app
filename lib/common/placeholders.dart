import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Color _baseColor = Colors.grey.shade300;
Color _highlightColor = Colors.grey.shade100;

class CarouselPlaceholder extends StatelessWidget {
  const CarouselPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 390 / 354,
      child: Shimmer.fromColors(
        child: Container(
          color: Colors.white,
        ),
        baseColor: _baseColor,
        highlightColor: _highlightColor,
      ),
    );
  }
}

class BannerPlaceholder extends StatelessWidget {
  const BannerPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 390 / 82,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
      ),
    );
  }
}

enum ContentLineType {
  twoLines,
  threeLines,
}

class ContentPlaceholder extends StatelessWidget {
  final ContentLineType lineType;

  const ContentPlaceholder({
    Key? key,
    required this.lineType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            ),
            width: 96.0,
            height: 72.0,
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: 10.0,
                  margin: const EdgeInsets.only(bottom: 8.0),
                ),
                if (lineType == ContentLineType.threeLines)
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    height: 10.0,
                    margin: const EdgeInsets.only(bottom: 8.0),
                  ),
                Container(color: Colors.white, width: 100.0, height: 10.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
