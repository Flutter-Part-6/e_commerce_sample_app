import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../domain_layer/model/display.model.dart';
import '../../../../common/utils/extensions.dart';
import 'core/view_module_widget.dart';
import 'widget/add_cart_button.dart';
import 'widget/view_module_padding.dart';
import 'widget/view_module_subtitle.dart';
import 'widget/view_module_title.dart';

class SpecialPriceViewModule extends StatelessWidget with ViewModuleWidget {
  const SpecialPriceViewModule(this.info, {Key? key}) : super(key: key);

  final ViewModule info;

  @override
  Widget build(BuildContext context) {
    return ViewModulePadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: ViewModuleTitle(
              title: info.title,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          ViewModuleSubtitle(
            subtitle: info.subtitle,
          ),
          const SizedBox(
            height: 8,
          ),
          if (info.time > 0)
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                children: [
                  Lottie.network(
                    'https://assets9.lottiefiles.com/packages/lf20_4htoEB.json',
                    width: 20,
                    delegates: LottieDelegates(
                      values: [
                        ValueDelegate.color(
                          const ['Oval', 'Oval', 'Fill 1'],
                          value: Theme.of(context).highlightColor,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  TimerWidget(
                    endTime: DateTime.fromMillisecondsSinceEpoch(
                      info.time,
                    ),
                  ),
                ],
              ),
            ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return SpecialPriceProduct(
                productInfo: info.products[index],
              );
            },
            separatorBuilder: (_, __) {
              return const SizedBox(
                height: 24,
              );
            },
            itemCount: info.products.length,
          ),
        ],
      ),
    );
  }
}

class TimerWidget extends StatefulWidget {
  final DateTime endTime;

  const TimerWidget({
    Key? key,
    required this.endTime,
  }) : super(key: key);

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  Timer? _timer;
  late Duration remainTime;

  @override
  void initState() {
    super.initState();

    remainTime = widget.endTime.difference(DateTime.now());

    if (remainTime > Duration.zero) {
      _timer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) {
          remainTime = widget.endTime.difference(DateTime.now());

          if (remainTime <= Duration.zero) {
            _timer?.cancel();
          }

          setState(() {});
        },
      );
    }
  }

  String _printDuration(Duration duration) {
    if (duration <= Duration.zero) {
      return 'TIME OUT';
    }

    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  void dispose() {
    super.dispose();

    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _printDuration(remainTime),
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}

class SpecialPriceProduct extends StatelessWidget {
  final ProductInfo productInfo;

  const SpecialPriceProduct({
    Key? key,
    required this.productInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            AspectRatio(
              aspectRatio: 2 / 1,
              child: Image.network(
                productInfo.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            AddCartButton(
              productInfo: productInfo,
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          productInfo.subtitle,
          style: textTheme.labelLarge?.copyWith(
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          productInfo.title,
          style: textTheme.titleMedium?.titleCopyWith(),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          children: [
            Text(
              '${productInfo.discountRate}%',
              style: textTheme.titleMedium?.discountRageCopyWith(),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              productInfo.price.toWon(),
              style: textTheme.titleMedium?.priceCopyWith(),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              productInfo.originalPrice.toWon(),
              style: textTheme.titleMedium?.originalPriceCopyWith(),
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          children: [
            const Icon(
              Icons.comment_outlined,
              size: 15,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              '후기 ${productInfo.reviewCount.toReview()}',
              style: textTheme.labelMedium?.reviewCountCopyWith(),
            ),
          ],
        ),
      ],
    );
  }
}
