import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../domain_layer/model/display.model.dart';
import '../../../../common/utils/extensions.dart';
import '../../../../theme/custom_theme.dart';
import '../../../../theme/typography.dart';
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: ViewModulePadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ViewModuleTitle(
              title: info.title,
            ),
            ViewModuleSubtitle(
              subtitle: info.subtitle,
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
                            value: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 5,
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
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: SpecialPriceProduct(
                    productInfo: info.products[index],
                  ),
                );
              },
              separatorBuilder: (_, __) {
                return const SizedBox(
                  height: 16,
                );
              },
              itemCount: info.products.length,
            ),
          ],
        ),
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
      style: Theme.of(context)
          .textTheme
          .headlineMedium
          ?.copyWith(
            color: Theme.of(context).colorScheme.contentPrimary,
          )
          .semiBold,
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
              aspectRatio: 343 / 174,
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
          height: 9,
        ),
        Text(
          productInfo.subtitle,
          style: textTheme.labelLarge
              ?.copyWith(
                color: Theme.of(context).colorScheme.contentTertiary,
              )
              .regular,
        ),
        const SizedBox(
          height: 7,
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
              style: textTheme.titleLarge?.discountRageCopyWith(),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              productInfo.price.toWon(),
              style: textTheme.titleLarge?.priceCopyWith(),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              productInfo.originalPrice.toWon(),
              style: textTheme.titleSmall?.originalPriceCopyWith(),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
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
