import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sample_app/domain_layer/model/display.model.dart';
import 'package:sample_app/presentation_layer/home_page/bloc/cart_bloc/cart_bloc.dart';
import 'package:sample_app/presentation_layer/home_page/component/view_modules/common/product_card.component.dart';
import 'package:sample_app/presentation_layer/home_page/component/view_modules/common/view_module_padding.dart';
import 'package:sample_app/presentation_layer/home_page/component/view_modules/common/view_module_subtitle.dart';

import 'common/view_module_title.dart';
import 'core/view_module_widget.dart';

class SpecialPriceViewModule extends StatelessWidget with ViewModuleWidget {
  const SpecialPriceViewModule(this.info, {Key? key}) : super(key: key);

  final ViewModule info;

  @override
  Widget build(BuildContext context) {
    print(info.time);
    return ViewModulePadding(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ViewModuleTitle(
              title: '🥳8주년 일일 특가',
            ),
            const SizedBox(
              height: 4,
            ),
            const ViewModuleSubtitle(
              subtitle: '24시간 놓칠 수 없는 가격',
            ),
            const SizedBox(
              height: 4,
            ),
            if (info.time > 0)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
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
    print(widget.endTime.toString());

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

  String _printDuration(Duration duration) {
    if (duration <= Duration.zero) {
      return 'TIME OUT';
    }

    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
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
        AspectRatio(
          aspectRatio: 2 / 1,
          child: Image.network(
            productInfo.imageUrl,
            fit: BoxFit.cover,
          ),
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
          style: textTheme.headlineSmall?.titleCopyWith(),
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
              style: textTheme.labelLarge?.originalPriceCopyWith(),
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
              color: Colors.grey,
              size: 15,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              '후기 ${productInfo.reviewCount.toReview()}',
              style: textTheme.labelLarge?.reviewCountCopyWith(),
            ),
          ],
        ),
      ],
    );
  }
}
