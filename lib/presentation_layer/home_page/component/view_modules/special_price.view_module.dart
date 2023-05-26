import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sample_app/presentation_layer/home_page/component/view_modules/common/view_module_subtitle.dart';

import 'common/view_module_title.dart';

class SpecialPriceViewModule extends StatelessWidget {
  const SpecialPriceViewModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
          Row(
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
                endTime: DateTime(2023, 5, 24, 13, 31),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return const SpecialPriceProduct(
                image:
                    'https://images.unsplash.com/photo-1480796927426-f609979314bd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
                subtitle: '집에서 만나는 메밀 명가',
                title: '[광화문 미진] 메밀국수 (2인분)',
                discountRate: '30%',
                discountPrice: '6,930원',
                originPrice: '9,900원',
                review: 1000000,
              );
            },
            separatorBuilder: (_, __) {
              return const SizedBox(
                height: 24,
              );
            },
            itemCount: 3,
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
          print('----');
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
  final String image;
  final String subtitle;
  final String title;
  final String originPrice;
  final String discountRate;
  final String discountPrice;
  final int review;

  const SpecialPriceProduct({
    Key? key,
    required this.image,
    required this.subtitle,
    required this.title,
    required this.originPrice,
    required this.discountRate,
    required this.discountPrice,
    required this.review,
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
            image,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          subtitle,
          style: textTheme.labelMedium?.copyWith(
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          title,
          style: textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          children: [
            Text(
              discountRate,
              style: textTheme.titleMedium?.copyWith(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              discountPrice,
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              originPrice,
              style: textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w300,
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
              ),
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
              '후기 ${review.toString()}+',
              style: textTheme.labelMedium?.copyWith(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
