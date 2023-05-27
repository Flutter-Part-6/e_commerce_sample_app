import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/domain_layer/model/display.model.dart';

import 'core/view_module_widget.dart';

class CarouselViewModule extends StatefulWidget with ViewModuleWidget {
  const CarouselViewModule(this.info, {Key? key, required}) : super(key: key);

  final ViewModule info;

  @override
  State<CarouselViewModule> createState() => _CarouselViewModuleState();
}

class _CarouselViewModuleState extends State<CarouselViewModule> {
  int currentPage = 1;
  late PageController pageController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    pageController = PageController();

    _timer = periodicTimer();
  }

  @override
  void dispose() {
    super.dispose();

    _timer.cancel();
    pageController.dispose();
  }

  Timer periodicTimer() {
    return Timer.periodic(
      const Duration(seconds: 4),
      (timer) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<ProductInfo> products = widget.info.products;

    return RawGestureDetector(
      gestures: {
        CustomizedGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<CustomizedGestureRecognizer>(
          () => CustomizedGestureRecognizer(),
          (CustomizedGestureRecognizer instance) {
            instance.onDown = (_) {
              if (_timer.isActive) {
                _timer.cancel();
              }
            };

            instance.onCancel = () {
              if (!_timer.isActive) {
                _timer = periodicTimer();
              }
            };

            instance.onEnd = (_) {
              if (!_timer.isActive) {
                _timer = periodicTimer();
              }
            };
          },
        )
      },
      child: AspectRatio(
        aspectRatio: 4 / 3,
        child: Stack(
          children: [
            PageView.builder(
              // physics: NeverScrollableScrollPhysics(),
              controller: pageController,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                String src = products[index % products.length].imageUrl;
                return Image.network(
                  src,
                  fit: BoxFit.cover,
                );
              },
              onPageChanged: (page) {
                setState(() {
                  currentPage = page % products.length + 1;
                });
              },
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: PageCountWidget(
                  currentPage: currentPage,
                  totalPage: products.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomizedGestureRecognizer extends HorizontalDragGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}

class AllowMultipleGestureRecognizer2 extends TapGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}

class PageCountWidget extends StatelessWidget {
  final int currentPage;
  final int totalPage;

  const PageCountWidget({
    Key? key,
    required this.currentPage,
    required this.totalPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black.withOpacity(0.3),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 4,
        ),
        child: Text(
          '$currentPage / $totalPage',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
    // return Text('$currentPage / $totalPage');
  }
}
